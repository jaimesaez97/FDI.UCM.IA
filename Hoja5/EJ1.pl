%% EJERCICIO 1

es_un(elefante_circense,elefante).
tiene_parte(elefante,cabeza).
tiene_parte(elefante,trompa).
tiene_parte(cabeza,boca).
es_un(elefante,animal).
tiene_parte(animal,corazón).
es_un(elefante_circense,acróbata).
tiene_parte(acróbata,disfraz).
es_un(disfraz,ropa).

% ?- es_un(elefante_circense,animal).
% HAY QUE AÑADIR HERENCIA A ES_UN
es_un(X,Z):- es_un(X,Y),
             es_un(Y,Z).
            
% ?- tiene_parte(elefante_circense,corazón).
tiene_parte(X,Y):- es_un(X,Z),
                   tiene_parte(Z,Y).
                   
% ?- tiene_parte(elefante_circense,boca).
tiene_parte(X,Y):- tiene_parte(X,Z),t
                   tiene_parte(Z,Y).
                   
% ?- tiene_parte(elefante_circense,ropa).
tiene_parte(X,Y):- ?¿