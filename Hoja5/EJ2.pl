%% EJERCICIO 2

% prestamo(+X,+Y,+Z):- X le prestó a Y el objeto Z.

prestamo(Juan,María,Coche).     % "Juan le prestó su coche a María" 
prestamo(María,Pablo,Coche).    % "Después María se lo prestó a Pablo"

% enfado(+X,+Y,+Z):- X se enfadó con Y por el motivo Z.
enfado(Juan,María,prestamo(María,Pablo,Coche)). % "Esto provocó que Juan se enfadara"

marca(Coche,Seat).
es_un(Seat,Coche).
es_un(Coche,Vehículo).
tiene_parte(Coche,Sistema Eléctrico).
tiene_parte(Sistema Eléctrico,Batería).
tiene_parte(Batería,Ácido).
es_un(Ácido,Producto Químico).

% "¿El coche de Juan es un vehículo?"
es_un(X,Z):- es_un(X,Y),
             es_un(Y,Z).
             
% "¿El coche de Juan tiene Sistema Eléctrico?"
tiene_parte(X,Y):- es_un(X,Z),
                   tiene_parte(Z,Y).
                   
% "¿El coche de Juan tiene batería?"
tiene_parte(X,Y):- tiene_parte(X,Z),
                   tiene_parte(Z,Y).
                   
% "¿El coche de Juan tiene un producto químico?"
tiene_parte(X,Y):- tiene_parte(X,Z),
                   es_un(Z,Y).
                   
                   
