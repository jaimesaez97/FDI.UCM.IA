%% EJERCICIO 10

% estado(AI,AD,BD,BI).
% "AD: posicion de arriba a la derecha   € [-,1,2,3]"
% "AI: posicion de arriba a la izquierda € [-,1,2,3]"
% "BD: posicion de abajo a la derecha    € [-,1,2,3]"
% "BI: posicion de abajo a la izquierda  € [-,1,2,3]"

% ESTADO INICIAL
inicial(estado(-,1,2,3)).

% ESTADO OBJETIVO
objetivo(estado(1,2,3,-)).

% MOVIMIENTOS
mvto(estado(-,X,Y,Z),estado(Z,X,Y,-),"1").
mvto(estado(-,X,Y,Z),estado(X,-,Y,Z),"2").

mvto(estado(X,-,Y,Z),estado(X,Y,-,Z),"3").
mvto(estado(X,-,Y,Z),estado(-,X,Y,Z),"4").

mvto(estado(X,Y,-,Z),estado(X,-,Y,Z),"5").
mvto(estado(X,Y,-,Z),estado(X,Y,Z,-),"6").

mvto(estado(X,Y,Z,-),estado(X,Y,-,Z),"7").
mvto(estado(X,Y,Z,-),estado(-,Y,Z,X),"8").

% BÚSQUEDA
puede(Estado,[]):- objetivo(Estado).
puede(Estado,[Op | Ops]):- mvto(Estado,EstadoSig,Op),
                           puede(EstadoSig,Ops).
                           
% BÚSQUEDA CONTROL REPETICIONES
puede(Estado,Visit,[]):- objetivo(Estado).
puede(Estado,[EstadoSig | Visit], [Op | Ops]):- mvto(Estado,EstadoSig,Op),
                                                puede(EstadoSig,Visit,Op).