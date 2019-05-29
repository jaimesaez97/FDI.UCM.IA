%% EJERCICIO 5

% progenitor(A,B) :- A es el/la padre/madre de B.

% parentesco(+X,+Y,?N) :- N es el grado de parentesco de X e Y (0: ninguno, else: menor nº aristas progenitor entre X e Y)
parentesco(X,Y,1):- progenitor(X,Y).
parentesco(Y,X,N):- parentesco(X,Y,N).
parentesco(X,Y,N+1):- progenitor(X,Z),
                      parentesco(Z,Y,N).