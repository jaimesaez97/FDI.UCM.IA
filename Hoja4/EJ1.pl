%% EJERCICIO 1


% sobre(X,Y) :- bloque X directamente encima de Y
sobre(D,C).
sobre(C,B).
sobre(B,A).
sobre(G,F).
sobre(F,E).
sobre(I,H).
izquierda(A,E).
izquierda(E,H).

% por_encima_de(X,Y) :- X está por encima de Y en la misma pila
por_encima_de(X,Y):- sobre(X,Y).
por_encima_de(X,Y):- sobre(X,Z),
                     por_encima_de(Z,Y).

% pila_izquierda(X,Y) :- X está en la pila inmediatamente a la izquierda de Y
pila_izquierda(X,Y):- izquierda(X,Y).
pila_izquierda(X,Y):- por_encima_de(X,Z),
                      pila_izquierda(Z,Y).
pila_izquierda(X,Y):- por_encima_de(Y,Z),
                      pila_izquierda(X,Z).
pila_izquierda(X,Y):- por_encima_de(X,Z),
                      por_encima_de(Y,W),
                      pila_izquierda(Z,W).

% ¿Qué bloques están por encima de otros bloques?
% ?- por_encima_de(X,Y).

% ¿Qué bloques están por encima del bloque F o en una pila situada inmediatamente a la
% izquierda de la pila en la que está F?
% ?- por_encima_de(X,F);
%    pila_izquierda(Y,F).

% ¿Qué bloques están por encima de otros bloques pero no están en una pila situada
% inmediatamente a la izquierda de algún bloque?
% ?- por_encima_de(X,Y),
%    !pila_izquierda(X,Z).