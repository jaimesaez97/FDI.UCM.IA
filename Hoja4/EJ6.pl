%% EJERCICIO 6

% estado(PosH,PosV,PosC,TieP)
% "PosH: posición donde se encuentra el mono € [centro,puerta,ventana]"
% "PosV: posición donde se encuentra el mono € [suelo, caja]"
% "PosC: posición donde se encuentra la caja € [centro, puerta, ventana]"
% "TieP: ¿ha conseguido el mono el plátano?  €  [sí, no]"


% ESTADO INICIAL
% "En la habitación hay una ventana y debajo hay una caja-> PosC : ventana"
% "Hay un mono en la puerta de una habitación-> PosH : puerta, PosV : suelo"
% "Quiere conseguir el platano -> TieP : no"
inicial(estado(puerta,suelo,ventana,no)).

% ESTADO OBJETIVO
% "El mono busca conseguir el plátano"
objetivo(estado(_,_,_,sí)).

% "El mono puede andar por el suelo"
andar(puerta, centro).
andar(puerta,ventana).
andar(ventana,centro).
andar(centro,ventana).
andar(ventana,puerta).
andar(centro,puerta).

% mvto(estado1, estado2, coste, operacion).
mvto(estado(P1,suelo,PC,T),estado(P2,suelo,PC,T),1, andar(P1,P2)) :- andar(P1,P2).

% "El mono puede empujar la caja"
empujar(centro,puerta).
empujar(centro,ventana).
empujar(puerta,centro).
empujar(puerta,ventana).
empujar(ventana,centro).
empujar(centro,ventana).

mvto(estado(P1,suelo,PC,T),estado(P2,suelo,P,T), 1, empujar(PC,P)) :- empujar(PC,P).

% "El mono puede subirse a la caja"
mvto(estado(P1,suelo,PC,T),estado(P2,caja,PC,T),1, subir).

% "El mono puede coger el plátano"
mvto(estado(centro,caja,centro,no),estado(centro,caja,centro,sí), 1, coger).


% BÚSQUEDA
puede(Estado,[]) :- objetivo(Estado).
puede(Estado,[OP | OPS]):- 
        mvto(Estado,EstadoSig,_,OP);
        puede(EstadoSig,OPS).
        
% BÚSQUEDA CONTROL REPETICIONES
puede(Estado,_,[]) :- objetivo(Estado).
puede(Estado,[EstadoSig | Visit],[OP | OPS]):-
    mvto(Estado,EstadoSig,_,OP),
    puede(EstadoSig,Visit,OPS).