%% EJERCICIO 3

% norte(X,Y) :- X está directamente al norte de Y.
norte(A,D).
norte(D,G).
norte(B,E).
norte(E,H).
norte(C,F).
norte(F,I).

% oeste(X,Y) :- X está directamente al oeste de Y.
oeste(A,B).
oeste(B,C).
oeste(D,E).
oeste(E,F).
oeste(G,H).
oeste(H,I).

% sur(X,Y) :- X está directamente al sur de Y.
sur(X,Y):- norte(Y,X).

% este(X,Y) :- X está directamente al este de Y.
este(X,Y):- oeste(Y,X).

% norte_trans(X,Y) :- X está al norte de Y.
norte_trans(X,Y):- norte(X,Y).
norte_trans(X,Y) :- norte(X,Z),norte_trans(Z,Y),
                   
% sur_trans(X,Y) :- X está al sur de Y.
sur_trans(X,Y):- sur_trans(Y,X).
                 
% este_tans(X,Y):- X está al este de Y.
este_trans(X,Y):- este(X,Z), 
                  este_trans(Z,Y).
                    
% oeste_trans(X,Y):- X está al oeste de Y.
oeste_trans(X,Y):- este_trans(Y,X).                
                 
% noroeste(X,Y) :- X está al noroeste de Y.
noroeste(X,Y):- norte_trans(X,Z),
                oeste_trans(Z,Y).
                
% noreste(X,Y) :- X está al noreste de Y.
noreste(X,Y):- norte_trans(X,Z),
               este_trans(Z,Y).
               
% suroeste(X,Y) :- X está al suroeste de Y.
suroeste(X,Y):- noreste(Y,X).
                
% sureste(X,Y) :- X está al sureste de Y.
sureste(X,Y):- noroeste(Y,X).

% situacion(X,Y,Z) :- X está al "Z" de Y, siendo Z=noroeste,suroeste,...
situacion(X,Y,"noroeste"):- noroeste(X,Y).
situacion(X,Y,"noreste"):- noreste(X,Y).
situacion(X,Y,"suroeste"):- suroeste(X,Y).
situacion(X,Y,"sureste"):- sureste(X,Y).
situacion(X,Y,"norte"):- norte_trans(X,Y).
situacion(X,Y,"sur"):- sur_trans(X,Y).
situacion(X,Y,"este"):- este_trans(X,Y).
situacion(X,Y,"oeste"):- oeste_trans(X,Y).