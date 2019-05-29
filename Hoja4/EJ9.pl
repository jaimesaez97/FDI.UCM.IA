%% EJERCICIO 9

% ESTADO
% estado(H1,H2,H3,R)
% "H1: indica el estado de la habitación 1     € [Limpia,Sucia]"
% "H2: indica el estado de la habitación 2     € [Limpia,Sucia]"
% "H3: indica el estado de la habitación 3     € [Limpia,Sucia]"
% "R : indica la ubicación del robot aspirador € [H1,H2,H3]"

% ESTADO INICIAL
inicial(estado(Sucia,Sucia,Sucia,H1)).

% ESTADO OBJETIVO
objetivo(estado(Limpia,Limpia,Limpia,_)).

% MOVIMIENTOS
mvto(estado(_,_,_,H1),estado(_,_,_,H2),"H1->H2").
mvto(estado(_,_,_,H2),estado(_,_,_,H1),"H2->H1").
mvto(estado(_,_,_,H2),estado(_,_,_,H3),"H2->H3").
mvto(estado(_,_,_,H3),estado(_,_,_,H2),"H3->H2").

mvto(estado(Sucia,_,_,H1),estado(Limpia,_,_,H1),"LimpiarH1").
mvto(estado(_,Sucia,_,H2),estado(_,Limpia,_,H2),"LimpiarH2").
mvto(estado(_,_,Sucia,H3),estado(_,_,Limpia,H3),"LimpiarH3").

% BÚSQUEDA
puede(Estado,[]):- objetivo(Estado).
puede(Estado,[Op | Ops]):- mvto(Estado,EstadoSig,Op),
                           puede(EstadoSig,Ops).
                           
% BÚSQUEDA CONTROL REPETICIONES
puede(Estado,Visit,[]):- objetivo(Estado).
puede(Estado,[EstadoSig | Visit], [Op | Ops]):- mvto(Estado,EstadoSig,Op),
                                                puede(EstadoSig,Visit,Op).



