%% EJERCICIO 8

% estado(Lobo,Cabra,Col,Bote) 
% "Lobo : orilla del río donde está el lobo  € [I,D]"
% "Cabra: orilla del río donde está la cabra € [I,D]"
% "Col  : orilla del río donde está la col   € [I,D]"
% "Bote : orilla del río donde está el bote  € [I,D]"

% ESTADO INICIAL
% "Un granjero se encuentra en la orilla izquierda de un río junto con un lobo, una cabra y una col"
inicial(estado(I,I,I,I)).

% ESTADO OBJETIVO 
% "El granjero pretende transportar al lobo, la cabra y la col al otro lado del río"
objetivo(estado(D,D,D,_)).

% ESTADO PELIGRO
% "No dejar solos en una orilla al lobo y a la cabra porque el lobo se comería a la cabra"
% "Tampoco puede dejar solas a la cabra y la col porque la cabra se comería la col"
peligro(estado(X,X,_,Y)).
peligro(estado(_,X,X,Y)).

% MOVIMIENTOS "Izq -> Der"
mvto(estado(I,_,_,I),estado(D,_,_,D),"LoboID").
mvto(estado(_,I,_,I),estado(_,D,_,D),"CabraID").
mvto(estado(_,_,I,I),estado(_,_,D,D),"ColID").

% MOVIMIENTOS "Der -> Izq"
mvto(estado(D,_,_,D),estado(I,_,_,I),"LoboDI").
mvto(estado(_,D,_,D),estado(_,I,_,I),"CabraDI").
mvto(estado(_,_,D,D),estado(_,_,I,I),"ColDI").

% BÚSQUEDA
puede(Estado,[]):- objetivo(Estado).
puede(Estado, [Op | Ops]):- mvto(Estado,EstadoSig,Op),
                            !peligro(EstadoSig),
                            puede(EstadoSig,Ops).
                            
% BÚSQUEDA CONTROL REPETICIONES
puede(Estado,Visit,[]):- objetivo(Estado).
puede(Estado,[EstadoSig | Visit], [Op | Ops]):- mvto(Estado,EstadoSig,Visit,Op),
                                                !peligro(EstadoSig),
                                                puede(EstadoSig, Visit, Ops).