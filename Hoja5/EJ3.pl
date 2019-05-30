%% EJERCICIO 3

% arista(?NombreR,+Origen,+Destino)
% "NombreR : nombre de la relación que une Origen y Destino € [es_un, tiene_parte]"
% "Origen  : punto desde el que se parte"
% "Destino : punto a donde se llega"

% hereda(tiene_parte,es_un)
% "Se hereda la propiedad tiene_parte a través de la relación es_un"

% es_un(B,A).
arista(es_un,B,A).

% tiene_parte(A,C).
arista(tiene_parte,A,C).

hereda(tiene_parte,es_un):- arista(es_un,X,Y),
                            arista(tiene_parte,Y,Z).
