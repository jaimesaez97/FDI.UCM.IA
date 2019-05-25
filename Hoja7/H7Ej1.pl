% Inteligencia Articicial

% DCGs

%% Ejercicio1

% es_verbo(Raiz,Infinitivo)
es_verbo(am,amar).
es_verbo(habl,hablar).
es_verbo(esper,esperar).

% es_terminacion(Terminación, Tiempo, Persona, Número)
es_terminacion(o, presente, primera, singular).
es_terminacion(as, presente, segunda, singular).
es_terminacion(a, presente, tercera, singular).
es_terminacion(amos, presente, primera, plural).
es_terminacion(ais, presente, segunda, plural).
es_terminacion(an, presente, tercera, plural).

es_terminacion(aré, futuro, primera, singular).
es_terminacion(arás, futuro, segunda, singular).
es_terminacion(ará, futuro, tercera, singular).
es_terminacion(aremos, futuro, primera, plural).
es_terminacion(aréis, futuro, segunda, plural).
es_terminacion(arán, futuro, tercera, plural).

% DCG
verbo(Infinitivo, Tiempo, Persona, Número) -->
	[V],
	{ 	name(V, VerboCadena),	% vCad = listaCarac[V]
		append(RaizCad, TerminacionCad, VerboCadena), 	% prueba combinaciones posibles de dividir verboCadena
														% en dos: raíz y terminación (alguna será correcta)
		name(Raiz, RaizCad),
		es_verbo(Raiz, Infinitivo),
		name(Terminacion, TerminacionCad),
		es_terminacion(Terminacion, Tiempo, Persona, Numero)
	}.

%% Ejercicio2

% es_pronombre(Pronomb, Persona, Número)
es_pronombre(yo, primera, singular).
es_pronombre(tú, segunda, singular).
es_pronombre(él, tercera, singular).
es_pronombre(ella, tercera, singular).
es_pronombre(nosotros, primera, plural).
es_pronombre(vosotros, segunda, plural).
es_pronombre(ellos, tercera, plural).
es_pronombre(ellas, tercera, plural).


% DCG
concordancia(Infinitivo, Tiempo, Persona, Número, PersonaPron, NúmeroPron) -->
	[V],
	{ 	name(V, FraseCad),		% FraseCad = listaCarac[V]
		append(PronCad,VerboCad, FraseCad),		% prueba todas las combianciones posibles de
												% dividir FraseCad en dos
		name(Pronombre, PronCad),
		es_pronombre(Pronombre, PersonaPron, NúmeroPron),	
		name(Verbo, VerboCad),
		append(RaizCad, TerminacionCad, VerboCad),
		name(Raiz, RaizCad),
		es_verbo(Raiz, Infinitivo),
		name(Terminacion, TerminacionCad),
		es_terminacion(Terminacion, Tiempo, Persona, Número),
		%write(Persona),
		%write(PersonaPron),
		%write(Número),
		%write(NúmeroPron),
		Número == NúmeroPron,
		Persona == PersonaPron
	}.

%% Ejercicio3

es_transitivo(leer).

