%% EJERCICIO 2

% descendiente_directo(Padre,Madre,Hijo,Sexo):- Hijo, de sexo Sexo, es hijo de Padre y Madre.
descendiente_directo(Manuel,Manuela,Manolo,Masculino).
descendiente_directo(Manuel,Manuela,Manolita,Femenino).
descendiente_directo(Manolo,Rita,Pepe,Masculino).
descendiente_directo(Manolo,Rita,Pepa,Femenino).
    % Aquí tenemos:
    %   Pepe y pepa nietos de Manuel y Manuela    
    %   Manuel y Manuela abuelos de Pepe y Pepa
    %   Manolo y Manolita hijos de Manuel y Manuela
    %   Manuel y Manuela padres de Manolo y Manolita
    %   Manolo y Rita padres de Pepe y Pepa
    %   Pepe y Pepa hijos de Manolo y Rita
    
% casados(Conyuge1, Conyuge2):- C1 y C2 están casados.
casados(Manuel,Manuela).
casados(Manolo,Rita).

% progenitor(P1, P2) :- P1 padre/madre de P2.
progenitor(X,Y):- descendiente_directo(X,_,Y,_),
                  descendiente_directo(_,X,Y,_).


% hermanastro(H1,H2) :- H1 hermanastro de H2.
hermanastro(X,Y):- (descendiente_directo(P,_,X,_),
                   descendiente_directo(P,_,Y,_));
                   (descendiente_directo(_,M,X,_),
                   descendiente_directo(_,M,X,_)).
% hermanastro2(H1,H2) :- igual que hermanastro(H1,H2) usando predicado progenitor.
hermanastro(X,Y):- progenitor(Z,X),
                   progenitor(Z,Y).
                   

% familiar_politico(F1,F2) :- F1 familiar político de F2.
% F1 es FP de F2 si el conyuge C1 de F1 es ascendiente o hijo de cualquier ascendiente de Q 

% Definimos predicado ascendiente_no_directo/2
ascendiente_no_directo(X,Y) :- progenitor(X,Z),
                               progenitor(Z,Y).
ascendiente_no_directo(X,Y) :- progenitor(X,Z),
                               ascendiente_no_directo(Z,Y).

familiar_politico(X,Y):- casados(Z,Y),
                         ascendiente_no_directo(X,Z).