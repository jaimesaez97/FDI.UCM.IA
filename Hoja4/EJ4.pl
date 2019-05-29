%% EJERCICIO 4

% "Alejandro y María Patricia están casados"
casados(Alejandro,MaríaP).

% "María está enamorada de Carlos Alberto"
enamorado(MaríaP,CarlosA).

% "Carlos Alberto no la quiere porque está casado con Manuela"
!enamorado(CarlosA,MaríaP).
casados(CarlosA,Manuela).

% "Augusto quiere a María Patricia"
enamorado(Augusto,MaríaP).

% "Luis José también está enamorado de María Patricia, a pesar de estar casado con Bárbara, de quién está enamorado Alejandro"
enamorado(LuisJ, MaríaP).
casados(LuisJ,Bárbara).
enamorado(Alejandro,Bárbara).

% matr_a_pique(X,Y):- X e Y forman matrimonio y están ambos enamorados de otras personas
matr_a_pique(X,Y):- casados(X,Y),
                    enamorado(X,Z),
                    enamorado(Y,W).

% celoso(X) :- "La persona a la que ama X está enamorado de otrx"
celoso(X):- enamorado(X,Y),
            enamorado(Z,Y).
            
% celoso(X) :- "Alguien ama al cónyuge de X"
celoso(X):- casados(X,Y),
            enamorado(Z,Y).
            
