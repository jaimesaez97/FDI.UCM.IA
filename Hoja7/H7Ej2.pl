% Inteligencia Artificial

% Hoja 7


%% Ejercicio2

	
%	Usando el analizador del ejercicio anterior, construir DCG que
% 	compruebe concoordancia en frases <pronombre_personal><verbo> 


% DCG
verbo(NumeroPron) -->
	[V],
	{ 	name(V, VerboCadena),	% vCad = listaCarac[V]
		append(RaizCad, TerminacionCad, VerboCadena), 	% 
		name(Raiz, RaizCad),
		es_verbo(Raiz, Infinitivo),
		name(Terminacion, TerminacionCad),
		es_terminacion(Terminacion, Tiempo, Persona, Numero)
	}.