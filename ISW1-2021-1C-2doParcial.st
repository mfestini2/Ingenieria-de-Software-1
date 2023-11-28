!classDefinition: #CartaDeTrucoTest category: 'ISW1-2021-1C-2doParcial'!
TestCase subclass: #CartaDeTrucoTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-2021-1C-2doParcial'!

!CartaDeTrucoTest methodsFor: 'test - igualdad' stamp: 'HAW 7/4/2021 17:31:47'!
test01SonIgualesConMismoPaloYNumero

	self assert: (CartaDeTruco bastoCon: 1) = (CartaDeTruco bastoCon: 1) 

	! !

!CartaDeTrucoTest methodsFor: 'test - igualdad' stamp: 'HAW 7/4/2021 17:31:47'!
test02SonDistintasConDistintoPalo

	self deny: (CartaDeTruco bastoCon: 1) = (CartaDeTruco oroCon: 1) 

	! !

!CartaDeTrucoTest methodsFor: 'test - igualdad' stamp: 'HAW 7/4/2021 17:31:47'!
test03SonDistintasConNumeroAunqueIgualPalo

	self deny: (CartaDeTruco bastoCon: 1) = (CartaDeTruco bastoCon: 2) 

	! !

!CartaDeTrucoTest methodsFor: 'test - igualdad' stamp: 'HAW 7/4/2021 17:31:47'!
test04CartasIgualesTienenElMismoHash

	self assert: (CartaDeTruco bastoCon: 1) hash equals: (CartaDeTruco bastoCon: 1) hash

	! !

!CartaDeTrucoTest methodsFor: 'test - igualdad' stamp: 'HAW 7/4/2021 17:31:47'!
test05UnaCartaEsDistintaACualquierObjetoQueNoSeaCarta

	self deny: (CartaDeTruco bastoCon: 1) = 1! !


!CartaDeTrucoTest methodsFor: 'test - creacion' stamp: 'HAW 7/5/2021 11:58:02'!
test07NoHayCartaDeTrucoConNumeroOcho

	self 
		should: [ CartaDeTruco oroCon: 8 ]
		raise: Error
		withMessageText: CartaDeTruco numeroDeCartaInvalidoErrorDescription! !

!CartaDeTrucoTest methodsFor: 'test - creacion' stamp: 'HAW 7/5/2021 11:58:02'!
test08NoHayCartaDeTrucoConNumeroNueve

	self 
		should: [ CartaDeTruco oroCon: 9 ]
		raise: Error
		withMessageText: CartaDeTruco numeroDeCartaInvalidoErrorDescription! !

!CartaDeTrucoTest methodsFor: 'test - creacion' stamp: 'HAW 7/5/2021 11:58:12'!
test09LosPalosDeLaCartaDeTrucoSonBastoOroEspadaYCopa

	self 
		should: [ CartaDeTruco palo: #otro numero: 1 ]
		raise: Error
		withMessageText: CartaDeTruco paloInvalidoErrorDescription! !

!CartaDeTrucoTest methodsFor: 'test - creacion' stamp: 'HAW 7/5/2021 11:58:02'!
test10NoSePuedeCrearCartaConNumeroMenorAUno

	self 
		should: [ CartaDeTruco espadaCon: 0 ]
		raise: Error 
		withMessageText: CartaDeTruco numeroDeCartaInvalidoErrorDescription ! !

!CartaDeTrucoTest methodsFor: 'test - creacion' stamp: 'HAW 7/5/2021 11:58:02'!
test11NoSePuedeCrearCartaConNumeroMayorADoce

	self 
		should: [ CartaDeTruco espadaCon: 13 ]
		raise: Error 
		withMessageText: CartaDeTruco numeroDeCartaInvalidoErrorDescription ! !

!CartaDeTrucoTest methodsFor: 'test - creacion' stamp: 'HAW 7/5/2021 11:58:02'!
test12ElNumeroDeLaCartaDebeSerEntero

	self 
		should: [ CartaDeTruco espadaCon: 1.1 ]
		raise: Error 
		withMessageText: CartaDeTruco numeroDeCartaInvalidoErrorDescription ! !


!CartaDeTrucoTest methodsFor: 'test - valor y comparacion' stamp: 'HAW 7/5/2021 10:55:30'!
test13LaTablaDeValoresEsCorrecta

	self assert: (CartaDeTruco anchoDeEspada mataA: CartaDeTruco anchoDeBasto).
	self assert: (CartaDeTruco anchoDeBasto mataA: CartaDeTruco sieteDeEspada).
	self assert: (CartaDeTruco sieteDeEspada mataA: CartaDeTruco sieteDeOro).
	self assert: (CartaDeTruco sieteDeOro mataA: (CartaDeTruco espadaCon: 3)).
	self assert: ((CartaDeTruco espadaCon: 3) empardaCon: (CartaDeTruco oroCon: 3)).
	self assert: ((CartaDeTruco espadaCon: 3) mataA: (CartaDeTruco espadaCon: 2)).
	self assert: ((CartaDeTruco espadaCon: 2) empardaCon: (CartaDeTruco oroCon: 2)).
	self assert: ((CartaDeTruco espadaCon: 2) mataA: (CartaDeTruco oroCon: 1)).
	self assert: ((CartaDeTruco oroCon: 1) empardaCon: (CartaDeTruco copaCon: 1)).
	self assert: ((CartaDeTruco oroCon: 1) mataA: (CartaDeTruco espadaCon: 12)).
	self assert: ((CartaDeTruco espadaCon: 12) empardaCon: (CartaDeTruco oroCon: 12)).
	self assert: ((CartaDeTruco espadaCon: 12) mataA: (CartaDeTruco espadaCon: 11)).
	self assert: ((CartaDeTruco espadaCon: 11) empardaCon: (CartaDeTruco oroCon: 11)).
	self assert: ((CartaDeTruco espadaCon: 11) mataA: (CartaDeTruco espadaCon: 10)).
	self assert: ((CartaDeTruco espadaCon: 10) empardaCon: (CartaDeTruco oroCon: 10)).
	self assert: ((CartaDeTruco espadaCon: 10) mataA: (CartaDeTruco copaCon: 7)).
	self assert: ((CartaDeTruco copaCon: 7) empardaCon: (CartaDeTruco bastoCon: 7)).
	self assert: ((CartaDeTruco copaCon: 7) mataA: (CartaDeTruco espadaCon: 6)).
	self assert: ((CartaDeTruco espadaCon: 6) empardaCon: (CartaDeTruco oroCon: 6)).
	self assert: ((CartaDeTruco espadaCon: 6) mataA: (CartaDeTruco espadaCon: 5)).
	self assert: ((CartaDeTruco espadaCon: 5) empardaCon: (CartaDeTruco oroCon: 5)).
	self assert: ((CartaDeTruco espadaCon: 5) mataA: (CartaDeTruco espadaCon: 4)).
	self assert: ((CartaDeTruco espadaCon: 4) empardaCon: (CartaDeTruco oroCon: 4)).

	{ 3. 2. 12. 11. 10. 6. 5. 4 } do: [ :unNumero |
		CartaDeTruco palos do: [ :unPalo | 
			self assert: ((CartaDeTruco espadaCon: unNumero) empardaCon: (CartaDeTruco palo: unPalo numero: unNumero)) ]]
	! !

!CartaDeTrucoTest methodsFor: 'test - valor y comparacion' stamp: 'HAW 7/5/2021 10:49:51'!
test14HayCartasQueNoSonPardas

	self deny: (CartaDeTruco anchoDeEspada empardaCon: CartaDeTruco anchoDeBasto)! !

!CartaDeTrucoTest methodsFor: 'test - valor y comparacion' stamp: 'HAW 7/5/2021 10:49:59'!
test15HayCartasQuePierdenConOtras

	self deny: (CartaDeTruco anchoDeBasto mataA: CartaDeTruco anchoDeEspada)! !

!CartaDeTrucoTest methodsFor: 'test - valor y comparacion' stamp: 'HAW 7/4/2021 17:53:21'!
test16SieteDeCopasYDeBastoEsSieteFalso

	self assert: (CartaDeTruco copaCon: 7) esSieteFalso.
	self assert: (CartaDeTruco bastoCon: 7) esSieteFalso ! !

!CartaDeTrucoTest methodsFor: 'test - valor y comparacion' stamp: 'HAW 7/4/2021 17:54:57'!
test17SieteDeOroYDeEspadaNoSonSieteFalso

	self deny: (CartaDeTruco sieteDeOro) esSieteFalso.
	self deny: (CartaDeTruco sieteDeEspada) esSieteFalso ! !

!CartaDeTrucoTest methodsFor: 'test - valor y comparacion' stamp: 'HAW 7/4/2021 17:55:53'!
test18AnchoDeOroYDeCopaSonAnchoFalsos

	self assert: (CartaDeTruco oroCon: 1) esAnchoFalso.
	self assert: (CartaDeTruco copaCon: 1) esAnchoFalso ! !

!CartaDeTrucoTest methodsFor: 'test - valor y comparacion' stamp: 'HAW 7/4/2021 17:56:28'!
test19AnchoDeEspadaYDeBastosNoSonAnchoFalsos

	self deny: (CartaDeTruco anchoDeEspada) esAnchoFalso.
	self deny: (CartaDeTruco anchoDeBasto) esAnchoFalso ! !

!CartaDeTrucoTest methodsFor: 'test - valor y comparacion' stamp: 'HAW 7/5/2021 11:58:24'!
test20FallaBuscandoValorDeCartaInválida

	"Creo una carta de manera inválida para probar la correctitud del la tabla de valores - Hernan"
	self 
		should: [ CartaDeTruco new initializePalo: #invalido numero: 1; valor ]
		raise: Error 
		withMessageText: CartaDeTruco tablaDeValoresIncorrectaOCartaInvalidaErrorDescription! !


!classDefinition: #TrucoTest category: 'ISW1-2021-1C-2doParcial'!
TestCase subclass: #TrucoTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-2021-1C-2doParcial'!

!TrucoTest methodsFor: 'as yet unclassified' stamp: 'AS 11/27/2023 19:27:24'!
test01PartidaDeTrucoCreadaCorrectamenteIniciaEnRonda1

	| partidaDeTruco mano1 mano2|
	
	mano1 := OrderedCollection with: CartaDeTruco anchoDeBasto with: CartaDeTruco anchoDeEspada with: CartaDeTruco sieteDeEspada .
	
	mano2 := OrderedCollection with: CartaDeTruco sieteDeOro with: (CartaDeTruco bastoCon: 3) with: (CartaDeTruco bastoCon: 2).
	
	partidaDeTruco := PartidaDeTruco repartirCartasAMano: mano1 repartirCartasAPie: mano2.
	
	self assert: partidaDeTruco primeraRonda.! !

!TrucoTest methodsFor: 'as yet unclassified' stamp: 'AS 11/27/2023 20:21:48'!
test02PartidaDeTrucoCreadaCorrectamenteNoJuegaPie

	| partidaDeTruco mano1 mano2|
	
	mano1 := OrderedCollection with: CartaDeTruco anchoDeBasto with: CartaDeTruco anchoDeEspada with: CartaDeTruco sieteDeEspada .
	
	mano2 := OrderedCollection with: CartaDeTruco sieteDeOro with: (CartaDeTruco bastoCon: 3) with: (CartaDeTruco bastoCon: 2).
	
	partidaDeTruco := PartidaDeTruco repartirCartasAMano: mano1 repartirCartasAPie: mano2.
	
	self should: [partidaDeTruco pieJuega: CartaDeTruco sieteDeOro]
	raise: Error - MessageNotUnderstood 
	withExceptionDo: [:anError| self assert: anError messageText equals: RondaDeTrucoIniciaMano noEsTurnoDePieErrorDescription.
		self assert: partidaDeTruco primeraRonda ]! !

!TrucoTest methodsFor: 'as yet unclassified' stamp: 'AS 11/27/2023 19:39:19'!
test03NoSePuedeCrearJuegoSiHayCartasRepetidasEnMano

	| mano1 mano2|
	
	mano1 := OrderedCollection with: CartaDeTruco anchoDeBasto with: CartaDeTruco anchoDeBasto  with: CartaDeTruco sieteDeEspada .
	
	mano2 := OrderedCollection with: CartaDeTruco sieteDeOro with: (CartaDeTruco bastoCon: 3) with: (CartaDeTruco bastoCon: 2).
	
	self should: [PartidaDeTruco repartirCartasAMano: mano1 repartirCartasAPie: mano2]
	raise: Error - MessageNotUnderstood 
	withExceptionDo: [:anError| self assert: anError messageText equals: PartidaDeTruco cartasRepetidasEnManosErrorDescription. ]! !

!TrucoTest methodsFor: 'as yet unclassified' stamp: 'AS 11/27/2023 19:41:18'!
test04NoSePuedeCrearJuegoSiHayCartasRepetidasEnPie

	| mano1 mano2|
	
	mano2 := OrderedCollection with: CartaDeTruco anchoDeBasto with: CartaDeTruco anchoDeBasto  with: CartaDeTruco sieteDeEspada .
	
	mano1 := OrderedCollection with: CartaDeTruco sieteDeOro with: (CartaDeTruco bastoCon: 3) with: (CartaDeTruco bastoCon: 2).
	
	self should: [PartidaDeTruco repartirCartasAMano: mano1 repartirCartasAPie: mano2]
	raise: Error - MessageNotUnderstood 
	withExceptionDo: [:anError| self assert: anError messageText equals: PartidaDeTruco cartasRepetidasEnManosErrorDescription. ]! !

!TrucoTest methodsFor: 'as yet unclassified' stamp: 'AS 11/27/2023 19:42:26'!
test05NoSePuedeCrearJuegoSiTienenRepetidasEntreSi

	| mano1 mano2|
	
	mano2 := OrderedCollection with: CartaDeTruco anchoDeBasto with: CartaDeTruco anchoDeEspada  with: CartaDeTruco sieteDeEspada .
	
	mano1 := OrderedCollection with: CartaDeTruco anchoDeBasto with: (CartaDeTruco bastoCon: 3) with: (CartaDeTruco bastoCon: 2).
	
	self should: [PartidaDeTruco repartirCartasAMano: mano1 repartirCartasAPie: mano2]
	raise: Error - MessageNotUnderstood 
	withExceptionDo: [:anError| self assert: anError messageText equals: PartidaDeTruco cartasRepetidasEnManosErrorDescription. ]! !

!TrucoTest methodsFor: 'as yet unclassified' stamp: 'AS 11/27/2023 19:50:24'!
test06NoSePuedeCrearJuegoSiManoTieneMasDe3Cartas

	| mano1 mano2|
	
	mano1 := OrderedCollection with: CartaDeTruco anchoDeBasto with: CartaDeTruco anchoDeEspada  with: CartaDeTruco sieteDeEspada with: CartaDeTruco sieteDeEspada .
	
	mano2 := OrderedCollection with: (CartaDeTruco bastoCon: 7) with: (CartaDeTruco bastoCon: 3) with: (CartaDeTruco bastoCon: 2).
	
	self should: [PartidaDeTruco repartirCartasAMano: mano1 repartirCartasAPie: mano2]
	raise: Error - MessageNotUnderstood 
	withExceptionDo: [:anError| self assert: anError messageText equals: PartidaDeTruco cantidadIncorrectaDeCartasErrorDescription. ]! !

!TrucoTest methodsFor: 'as yet unclassified' stamp: 'AS 11/27/2023 19:50:42'!
test07NoSePuedeCrearJuegoSiManoTieneMenosDe3Cartas

	| mano1 mano2|
	
	mano1 := OrderedCollection with: CartaDeTruco anchoDeBasto with: CartaDeTruco anchoDeEspada.
	mano2 := OrderedCollection with: (CartaDeTruco bastoCon: 7) with: (CartaDeTruco bastoCon: 3) with: (CartaDeTruco bastoCon: 2).
	
	self should: [PartidaDeTruco repartirCartasAMano: mano1 repartirCartasAPie: mano2]
	raise: Error - MessageNotUnderstood 
	withExceptionDo: [:anError| self assert: anError messageText equals: PartidaDeTruco cantidadIncorrectaDeCartasErrorDescription. ]! !

!TrucoTest methodsFor: 'as yet unclassified' stamp: 'AS 11/27/2023 19:51:56'!
test08NoSePuedeCrearJuegoSiPieTieneMasDe3Cartas

	| mano1 mano2|
	
	mano1 := OrderedCollection with: CartaDeTruco anchoDeBasto with: CartaDeTruco anchoDeEspada  with: CartaDeTruco sieteDeEspada with: CartaDeTruco sieteDeEspada .
	
	mano2 := OrderedCollection with: (CartaDeTruco bastoCon: 7) with: (CartaDeTruco bastoCon: 3) with: (CartaDeTruco bastoCon: 2).
	
	self should: [PartidaDeTruco repartirCartasAMano: mano2 repartirCartasAPie: mano1]
	raise: Error - MessageNotUnderstood 
	withExceptionDo: [:anError| self assert: anError messageText equals: PartidaDeTruco cantidadIncorrectaDeCartasErrorDescription. ]! !

!TrucoTest methodsFor: 'as yet unclassified' stamp: 'AS 11/27/2023 19:53:04'!
test09NoSePuedeCrearJuegoSiPieTieneMenosDe3Cartas

	| mano1 mano2|
	
	mano1 := OrderedCollection with: CartaDeTruco anchoDeBasto with: CartaDeTruco anchoDeEspada .
	
	mano2 := OrderedCollection with: (CartaDeTruco bastoCon: 7) with: (CartaDeTruco bastoCon: 3) with: (CartaDeTruco bastoCon: 2).
	
	self should: [PartidaDeTruco repartirCartasAMano: mano2 repartirCartasAPie: mano1]
	raise: Error - MessageNotUnderstood 
	withExceptionDo: [:anError| self assert: anError messageText equals: PartidaDeTruco cantidadIncorrectaDeCartasErrorDescription. ]! !

!TrucoTest methodsFor: 'as yet unclassified' stamp: 'AS 11/27/2023 20:03:14'!
test10PrimeraRondaManoMataAPie

	| partidaDeTruco mano1 mano2|
	
	mano1 := OrderedCollection with: CartaDeTruco anchoDeBasto with: CartaDeTruco anchoDeEspada with: CartaDeTruco sieteDeEspada .
	
	mano2 := OrderedCollection with: CartaDeTruco sieteDeOro with: (CartaDeTruco bastoCon: 3) with: (CartaDeTruco bastoCon: 2).
	
	partidaDeTruco := PartidaDeTruco repartirCartasAMano: mano1 repartirCartasAPie: mano2.
	
	partidaDeTruco manoJuega: mano1 second.
	
	partidaDeTruco pieJuega: mano2 first.
	
	self deny: partidaDeTruco primeraRonda .
	self assert: partidaDeTruco segundaRonda.
	self assert: partidaDeTruco cantidadDeRondasGanadasPorMano equals: 1.
	self assert: partidaDeTruco cantidadDeRondasGanadasPorPie equals: 0.! !

!TrucoTest methodsFor: 'as yet unclassified' stamp: 'AS 11/27/2023 20:35:12'!
test11PrimeraRondaManoEmpardaAPie

	| partidaDeTruco mano1 mano2|
	
	mano1 := OrderedCollection with: CartaDeTruco anchoDeBasto with: CartaDeTruco anchoDeEspada with: (CartaDeTruco espadaCon: 3) .
	
	mano2 := OrderedCollection with: CartaDeTruco sieteDeOro with: (CartaDeTruco bastoCon: 3) with: (CartaDeTruco bastoCon: 2).
	
	partidaDeTruco := PartidaDeTruco repartirCartasAMano: mano1 repartirCartasAPie: mano2.
	
	partidaDeTruco manoJuega: mano1 third.
	
	partidaDeTruco pieJuega: mano2 second.
	
	self deny: partidaDeTruco primeraRonda .
	self assert: partidaDeTruco segundaRonda.
	self assert: partidaDeTruco cantidadDeRondasGanadasPorMano equals: 0.
	self assert: partidaDeTruco cantidadDeRondasGanadasPorPie equals: 0.! !

!TrucoTest methodsFor: 'as yet unclassified' stamp: 'AS 11/27/2023 20:37:19'!
test12PrimeraRondaPieMataAMano

	| partidaDeTruco mano1 mano2|
	
	mano2 := OrderedCollection with: CartaDeTruco anchoDeBasto with: CartaDeTruco anchoDeEspada with: CartaDeTruco sieteDeEspada .
	
	mano1 := OrderedCollection with: CartaDeTruco sieteDeOro with: (CartaDeTruco bastoCon: 3) with: (CartaDeTruco bastoCon: 2).
	
	partidaDeTruco := PartidaDeTruco repartirCartasAMano: mano1 repartirCartasAPie: mano2.
	
	partidaDeTruco manoJuega: mano1 second.
	
	partidaDeTruco pieJuega: mano2 first.
	
	self deny: partidaDeTruco primeraRonda .
	self assert: partidaDeTruco segundaRonda.
	self assert: partidaDeTruco cantidadDeRondasGanadasPorMano equals: 0.
	self assert: partidaDeTruco cantidadDeRondasGanadasPorPie equals: 1.! !

!TrucoTest methodsFor: 'as yet unclassified' stamp: 'AS 11/27/2023 20:45:07'!
test13PieNoPuedeJugarCartaQueNoPosea

	| partidaDeTruco mano1 mano2|
	
	mano2 := OrderedCollection with: CartaDeTruco anchoDeBasto with: CartaDeTruco anchoDeEspada with: CartaDeTruco sieteDeEspada .
	
	mano1 := OrderedCollection with: CartaDeTruco sieteDeOro with: (CartaDeTruco bastoCon: 3) with: (CartaDeTruco bastoCon: 2).
	
	partidaDeTruco := PartidaDeTruco repartirCartasAMano: mano1 repartirCartasAPie: mano2.
	
	partidaDeTruco manoJuega: mano1 second.
	
	self should: [partidaDeTruco pieJuega: mano1 second]
	raise: Error 
	withExceptionDo: [:anError|self assert: anError messageText equals: partidaDeTruco class jugadorNoPoseeEsaCartaErrorDescription]
	! !

!TrucoTest methodsFor: 'as yet unclassified' stamp: 'AS 11/27/2023 20:47:42'!
test14ManoNoPuedeJugarCartaQueNoPosea

	| partidaDeTruco mano1 mano2|
	
	mano2 := OrderedCollection with: CartaDeTruco anchoDeBasto with: CartaDeTruco anchoDeEspada with: CartaDeTruco sieteDeEspada .
	
	mano1 := OrderedCollection with: CartaDeTruco sieteDeOro with: (CartaDeTruco bastoCon: 3) with: (CartaDeTruco bastoCon: 2).
	
	partidaDeTruco := PartidaDeTruco repartirCartasAMano: mano1 repartirCartasAPie: mano2.
	
	partidaDeTruco manoJuega: mano1 second.
	
	self should: [partidaDeTruco manoJuega: mano2 second]
	raise: Error 
	withExceptionDo: [:anError|self assert: anError messageText equals: partidaDeTruco class jugadorNoPoseeEsaCartaErrorDescription]
	! !

!TrucoTest methodsFor: 'as yet unclassified' stamp: 'AS 11/27/2023 20:58:34'!
test15GanoManoPrimeraSegundaRondaManoMataAPieGanaMano

	| partidaDeTruco mano1 mano2|
	
	mano1 := OrderedCollection with: CartaDeTruco anchoDeBasto with: CartaDeTruco anchoDeEspada with: CartaDeTruco sieteDeEspada .
	
	mano2 := OrderedCollection with: CartaDeTruco sieteDeOro with: (CartaDeTruco bastoCon: 3) with: (CartaDeTruco bastoCon: 2).
	
	partidaDeTruco := PartidaDeTruco repartirCartasAMano: mano1 repartirCartasAPie: mano2.
	
	partidaDeTruco manoJuega: mano1 second.
	
	partidaDeTruco pieJuega: mano2 first.
	
	partidaDeTruco manoJuega: mano1 first.
	
	partidaDeTruco pieJuega: mano2 third.
	
	self assert: partidaDeTruco ganoMano.
	self assert: partidaDeTruco cantidadDeRondasGanadasPorMano equals: 2.! !

!TrucoTest methodsFor: 'as yet unclassified' stamp: 'AS 11/27/2023 21:06:47'!
test16GanoManoPrimeraSegundaRondaNoPuedeJugarPie

	| partidaDeTruco mano1 mano2|
	
	mano1 := OrderedCollection with: CartaDeTruco anchoDeBasto with: CartaDeTruco anchoDeEspada with: CartaDeTruco sieteDeEspada .
	
	mano2 := OrderedCollection with: CartaDeTruco sieteDeOro with: (CartaDeTruco bastoCon: 3) with: (CartaDeTruco bastoCon: 2).
	
	partidaDeTruco := PartidaDeTruco repartirCartasAMano: mano1 repartirCartasAPie: mano2.
	
	partidaDeTruco manoJuega: mano1 second.
	
	partidaDeTruco pieJuega: mano2 first.
	
	self should: [partidaDeTruco pieJuega: mano2 third.]
	raise: Error - MessageNotUnderstood 
	withExceptionDo: [:anError| self assert: anError messageText equals: RondaDeTrucoIniciaMano noEsTurnoDePieErrorDescription.
		self assert: partidaDeTruco segundaRonda ]
	! !

!TrucoTest methodsFor: 'as yet unclassified' stamp: 'AS 11/27/2023 21:05:13'!
test17GanoManoPrimeraSegundaRondaPieMataAMano

	| partidaDeTruco mano1 mano2|
	
	mano1 := OrderedCollection with: CartaDeTruco anchoDeBasto with: CartaDeTruco anchoDeEspada with:  (CartaDeTruco bastoCon: 2) .
	
	mano2 := OrderedCollection with: CartaDeTruco sieteDeOro with: (CartaDeTruco bastoCon: 3) with: (CartaDeTruco sieteDeEspada ).
	
	partidaDeTruco := PartidaDeTruco repartirCartasAMano: mano1 repartirCartasAPie: mano2.
	
	partidaDeTruco manoJuega: mano1 second.
	
	partidaDeTruco pieJuega: mano2 first.
	
	partidaDeTruco manoJuega: mano1 third.
	
	partidaDeTruco pieJuega: mano2 third.
	
	self deny: partidaDeTruco ganoMano.
	self assert: partidaDeTruco cantidadDeRondasGanadasPorMano equals: 1.
	self assert: partidaDeTruco cantidadDeRondasGanadasPorPie equals: 1.
	self assert: partidaDeTruco tercerRonda.! !

!TrucoTest methodsFor: 'as yet unclassified' stamp: 'AS 11/27/2023 21:11:47'!
test18GanoPiePrimeraSegundaRondaPieMataAManoGanoPie

	| partidaDeTruco mano1 mano2|
	
	mano2 := OrderedCollection with: CartaDeTruco anchoDeBasto with: CartaDeTruco anchoDeEspada with: CartaDeTruco sieteDeEspada .
	
	mano1 := OrderedCollection with: CartaDeTruco sieteDeOro with: (CartaDeTruco bastoCon: 3) with: (CartaDeTruco bastoCon: 2).
	
	partidaDeTruco := PartidaDeTruco repartirCartasAMano: mano1 repartirCartasAPie: mano2.
	
	partidaDeTruco manoJuega: mano1 second.
	
	partidaDeTruco pieJuega: mano2 first.
	
	partidaDeTruco pieJuega: mano2 third.
	
	partidaDeTruco manoJuega: mano1 third.
	
	self deny: partidaDeTruco ganoMano.
	self assert: partidaDeTruco ganoPie. 	
	self assert: partidaDeTruco cantidadDeRondasGanadasPorMano equals: 0.
	self assert: partidaDeTruco cantidadDeRondasGanadasPorPie equals: 2.
	self assert: partidaDeTruco tercerRonda.! !

!TrucoTest methodsFor: 'as yet unclassified' stamp: 'AS 11/27/2023 21:11:56'!
test19GanoPiePrimeraSegundaRondaNoPuedeJugarMano

	| partidaDeTruco mano1 mano2|
	
	mano2 := OrderedCollection with: CartaDeTruco anchoDeBasto with: CartaDeTruco anchoDeEspada with: CartaDeTruco sieteDeEspada .
	
	mano1 := OrderedCollection with: CartaDeTruco sieteDeOro with: (CartaDeTruco bastoCon: 3) with: (CartaDeTruco bastoCon: 2).
	
	partidaDeTruco := PartidaDeTruco repartirCartasAMano: mano1 repartirCartasAPie: mano2.
	
	partidaDeTruco manoJuega: mano1 second.
	
	partidaDeTruco pieJuega: mano2 first.
	
	self should: [partidaDeTruco manoJuega: mano1 third.]
	raise: Error - MessageNotUnderstood 
	withExceptionDo: [:anError| self assert: anError messageText equals: RondaDeTrucoIniciaMano noEsTurnoDePieErrorDescription.
		self assert: partidaDeTruco segundaRonda ]
	
	
	
	! !

!TrucoTest methodsFor: 'as yet unclassified' stamp: 'AS 11/27/2023 21:15:04'!
test20GanoPiePrimeraSegundaRondaManoMataAPie

	| partidaDeTruco mano1 mano2|
	
	mano2 := OrderedCollection with: CartaDeTruco anchoDeBasto with: CartaDeTruco anchoDeEspada with:(CartaDeTruco bastoCon: 6) .
	
	mano1 := OrderedCollection with: CartaDeTruco sieteDeOro with: (CartaDeTruco bastoCon: 3) with: (CartaDeTruco bastoCon: 2).
	
	partidaDeTruco := PartidaDeTruco repartirCartasAMano: mano1 repartirCartasAPie: mano2.
	
	partidaDeTruco manoJuega: mano1 second.
	
	partidaDeTruco pieJuega: mano2 first.
	
	partidaDeTruco pieJuega: mano2 third.
	
	partidaDeTruco manoJuega: mano1 first.
	
	self deny: partidaDeTruco ganoMano.
	self deny: partidaDeTruco ganoPie. 	
	self assert: partidaDeTruco cantidadDeRondasGanadasPorMano equals: 1.
	self assert: partidaDeTruco cantidadDeRondasGanadasPorPie equals: 1.
	self assert: partidaDeTruco tercerRonda.! !


!classDefinition: #CartaDeTruco category: 'ISW1-2021-1C-2doParcial'!
Object subclass: #CartaDeTruco
	instanceVariableNames: 'palo numero'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-2021-1C-2doParcial'!

!CartaDeTruco methodsFor: 'initialization' stamp: 'HAW 7/3/2021 15:27:51'!
initializePalo: unPalo numero: unNumero 
	
	palo := unPalo.
	numero := unNumero.! !


!CartaDeTruco methodsFor: 'comparing' stamp: 'HAW 7/2/2021 11:44:36'!
= unaCarta 
	
	^(unaCarta isKindOf: self class) and: [(unaCarta paloEs: palo) and: [ unaCarta numeroEs: numero ]]! !

!CartaDeTruco methodsFor: 'comparing' stamp: 'HAW 7/5/2021 10:49:51'!
empardaCon: cartaParda

	^self valor = cartaParda valor! !

!CartaDeTruco methodsFor: 'comparing' stamp: 'HAW 7/2/2021 11:43:24'!
hash
	
	^palo hash bitXor: numero hash ! !

!CartaDeTruco methodsFor: 'comparing' stamp: 'HAW 7/5/2021 10:49:59'!
mataA: cartaPerdedora

	^self valor < cartaPerdedora valor! !

!CartaDeTruco methodsFor: 'comparing' stamp: 'HAW 7/2/2021 11:41:53'!
numeroEs: unNumero

	^numero = unNumero ! !

!CartaDeTruco methodsFor: 'comparing' stamp: 'HAW 7/2/2021 11:41:39'!
paloEs: unPalo

	^palo = unPalo ! !


!CartaDeTruco methodsFor: 'testing' stamp: 'HAW 7/4/2021 17:50:20'!
esAncho

	^ self numeroEs: 1! !

!CartaDeTruco methodsFor: 'testing' stamp: 'HAW 7/4/2021 17:50:31'!
esAnchoDeBasto
	
	^self esAncho and: [ self esDeBasto ]! !

!CartaDeTruco methodsFor: 'testing' stamp: 'HAW 7/4/2021 17:50:41'!
esAnchoDeEspada
	
	^self esAncho and: [ self esDeEspada ]! !

!CartaDeTruco methodsFor: 'testing' stamp: 'HAW 7/4/2021 17:50:20'!
esAnchoFalso
	
	^self esAncho and: [ self esDeOro or: [ self esDeCopa ]]! !

!CartaDeTruco methodsFor: 'testing' stamp: 'HAW 7/3/2021 15:19:32'!
esCaballo
	
	^self numeroEs: 11! !

!CartaDeTruco methodsFor: 'testing' stamp: 'HAW 7/3/2021 15:25:29'!
esDeBasto
	
	^self paloEs: self basto! !

!CartaDeTruco methodsFor: 'testing' stamp: 'HAW 7/3/2021 15:26:09'!
esDeCopa
	
	^self paloEs: self copa! !

!CartaDeTruco methodsFor: 'testing' stamp: 'HAW 7/3/2021 15:26:18'!
esDeEspada
	
	^self paloEs: self espada ! !

!CartaDeTruco methodsFor: 'testing' stamp: 'HAW 7/3/2021 15:26:35'!
esDeOro
	
	^self paloEs: self oro! !

!CartaDeTruco methodsFor: 'testing' stamp: 'HAW 7/3/2021 15:19:22'!
esRey
	
	^self numeroEs: 12! !

!CartaDeTruco methodsFor: 'testing' stamp: 'HAW 7/3/2021 15:16:57'!
esSiete
	
	^self numeroEs: 7! !

!CartaDeTruco methodsFor: 'testing' stamp: 'HAW 7/3/2021 15:27:00'!
esSieteDeEspadas
	
	^self esSiete and: [ self esDeEspada ]! !

!CartaDeTruco methodsFor: 'testing' stamp: 'HAW 7/3/2021 15:27:15'!
esSieteDeOro
	
	^self esSiete and: [ self esDeOro ]! !

!CartaDeTruco methodsFor: 'testing' stamp: 'HAW 7/3/2021 15:26:09'!
esSieteFalso
	
	^self esSiete and: [ self esDeCopa or: [ self esDeBasto ]]! !

!CartaDeTruco methodsFor: 'testing' stamp: 'HAW 7/3/2021 15:19:43'!
esSota
	
	^self numeroEs: 10! !


!CartaDeTruco methodsFor: 'printing' stamp: 'HAW 7/3/2021 15:14:43'!
printOn: aStream

	aStream 
		print: numero;
		nextPutAll: ' de ';
		nextPutAll: 	palo ! !


!CartaDeTruco methodsFor: 'valor' stamp: 'HAW 7/3/2021 14:51:09'!
valor
	
	^self class valorDe: self! !


!CartaDeTruco methodsFor: 'palos' stamp: 'HAW 7/3/2021 15:24:33'!
basto
	
	^self class basto! !

!CartaDeTruco methodsFor: 'palos' stamp: 'HAW 7/3/2021 15:24:44'!
copa

	^ self class copa! !

!CartaDeTruco methodsFor: 'palos' stamp: 'HAW 7/3/2021 15:24:08'!
espada
	
	^self class espada! !

!CartaDeTruco methodsFor: 'palos' stamp: 'HAW 7/3/2021 15:26:27'!
oro

	^ self class oro! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CartaDeTruco class' category: 'ISW1-2021-1C-2doParcial'!
CartaDeTruco class
	instanceVariableNames: 'ordenDePrioridad'!

!CartaDeTruco class methodsFor: 'instance creation' stamp: 'HAW 7/4/2021 17:49:37'!
anchoDeBasto
	
	^self bastoCon: 1! !

!CartaDeTruco class methodsFor: 'instance creation' stamp: 'HAW 7/4/2021 17:49:57'!
anchoDeEspada
	
	^self espadaCon: 1! !

!CartaDeTruco class methodsFor: 'instance creation' stamp: 'HAW 7/3/2021 14:57:03'!
bastoCon: unNumero

	^self palo: self basto numero: unNumero! !

!CartaDeTruco class methodsFor: 'instance creation' stamp: 'HAW 7/3/2021 14:57:08'!
copaCon: unNumero

	^self palo: self copa numero: unNumero! !

!CartaDeTruco class methodsFor: 'instance creation' stamp: 'HAW 7/3/2021 14:57:16'!
espadaCon: unNumero

	^self palo: self espada numero: unNumero ! !

!CartaDeTruco class methodsFor: 'instance creation' stamp: 'HAW 7/3/2021 14:57:34'!
oroCon: unNumero

	^self palo: self oro numero: unNumero ! !

!CartaDeTruco class methodsFor: 'instance creation' stamp: 'HAW 7/4/2021 18:06:08'!
palo: unPalo numero: unNumero 
	
	self assertNúmeroEsVálido: unNumero.
	self assertPaloEsVálido: unPalo.
	
	^self new initializePalo: unPalo numero: unNumero ! !

!CartaDeTruco class methodsFor: 'instance creation' stamp: 'HAW 7/3/2021 15:12:50'!
sieteDeEspada
	
	^self espadaCon: 7! !

!CartaDeTruco class methodsFor: 'instance creation' stamp: 'HAW 7/3/2021 15:17:44'!
sieteDeOro
	
	^self oroCon: 7! !


!CartaDeTruco class methodsFor: 'palos' stamp: 'HAW 7/3/2021 14:56:25'!
basto
	
	^#basto! !

!CartaDeTruco class methodsFor: 'palos' stamp: 'HAW 7/3/2021 14:57:25'!
copa
	
	^#copa! !

!CartaDeTruco class methodsFor: 'palos' stamp: 'HAW 7/3/2021 14:55:44'!
espada
	
	^#espada! !

!CartaDeTruco class methodsFor: 'palos' stamp: 'HAW 7/3/2021 14:57:43'!
oro
	
	^#oro! !

!CartaDeTruco class methodsFor: 'palos' stamp: 'HAW 7/4/2021 18:07:36'!
palos

	"No se puede acceder a self en backtick, por eso se usa CartaDeTruco como receiver - Hernan"
	^ `{CartaDeTruco espada. CartaDeTruco basto. CartaDeTruco oro. CartaDeTruco copa }`! !


!CartaDeTruco class methodsFor: 'initialization' stamp: 'HAW 7/5/2021 10:52:07'!
initializeOrdenDePrioridad
	
	"Cuanto más chico sea el índice de la carta en esta colección, más valor tiene - Hernan"
	ordenDePrioridad := OrderedCollection new.
	
	ordenDePrioridad 
		add: [ :carta | carta esAnchoDeEspada ];
		add: [ :carta | carta esAnchoDeBasto ];
		add: [ :carta | carta esSieteDeEspadas ];
		add: [ :carta | carta esSieteDeOro ];
		add: [ :carta | carta numeroEs: 3 ];
		add: [ :carta | carta numeroEs: 2 ];
		add: [ :carta | carta esAnchoFalso ];
		add: [ :carta | carta esRey ];
		add: [ :carta | carta esCaballo ];
		add: [ :carta | carta esSota ];
		add: [ :carta | carta esSieteFalso ];
		add: [ :carta | carta numeroEs: 6 ];
		add: [ :carta | carta numeroEs: 5 ];
		add: [ :carta | carta numeroEs: 4 ];
		yourself.
	
	! !


!CartaDeTruco class methodsFor: 'valor' stamp: 'HAW 7/3/2021 14:54:01'!
ordenDePrioridad
	
	^ordenDePrioridad ifNil: [ self initializeOrdenDePrioridad ] ! !

!CartaDeTruco class methodsFor: 'valor' stamp: 'HAW 7/5/2021 11:58:24'!
valorDe: unaCarta 
	
	self ordenDePrioridad withIndexDo: [ :bloqueDeVerificacion :index |
		(bloqueDeVerificacion value: unaCarta) ifTrue: [ ^index ]].
	
	self error: self tablaDeValoresIncorrectaOCartaInvalidaErrorDescription! !


!CartaDeTruco class methodsFor: 'error descriptions' stamp: 'HAW 7/5/2021 11:58:02'!
numeroDeCartaInvalidoErrorDescription
	
	^'El truco no se puede jugar con ochos ni con nueves'! !

!CartaDeTruco class methodsFor: 'error descriptions' stamp: 'HAW 7/5/2021 11:58:12'!
paloInvalidoErrorDescription
	
	^'Los palos de la carta solo pueden ser espada, basto, oro y copa'! !

!CartaDeTruco class methodsFor: 'error descriptions' stamp: 'HAW 7/5/2021 11:58:24'!
tablaDeValoresIncorrectaOCartaInvalidaErrorDescription
	
	^'Error de programación: Tabla de valores incorrecta o carta inválida'! !


!CartaDeTruco class methodsFor: 'assertions' stamp: 'HAW 7/5/2021 11:58:02'!
assertNúmeroEsVálido: unNumero

	unNumero < 1 ifTrue: [ self error: self numeroDeCartaInvalidoErrorDescription ].
	unNumero > 12 ifTrue: [ self error: self numeroDeCartaInvalidoErrorDescription ].
	(unNumero between: 8 and: 9) ifTrue: [ self error: self numeroDeCartaInvalidoErrorDescription ].
	unNumero isInteger ifFalse: [ self error: self numeroDeCartaInvalidoErrorDescription ]! !

!CartaDeTruco class methodsFor: 'assertions' stamp: 'HAW 7/5/2021 11:58:12'!
assertPaloEsVálido: unPalo

	^ (self palos includes: unPalo) ifFalse: [ self error: self paloInvalidoErrorDescription ]! !


!classDefinition: #PartidaDeTruco category: 'ISW1-2021-1C-2doParcial'!
Object subclass: #PartidaDeTruco
	instanceVariableNames: 'tresCartasMano tresCartasPie rondaActual ronda rondasGanadasPorMano rondasGanadasPorPie'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-2021-1C-2doParcial'!

!PartidaDeTruco methodsFor: 'intialize' stamp: 'AS 11/27/2023 20:33:38'!
cantidadDeRondasGanadasPorMano

	^rondasGanadasPorMano! !

!PartidaDeTruco methodsFor: 'intialize' stamp: 'AS 11/27/2023 20:38:45'!
cantidadDeRondasGanadasPorPie

	^rondasGanadasPorPie ! !

!PartidaDeTruco methodsFor: 'intialize' stamp: 'AS 11/27/2023 20:56:44'!
ganoMano

	^rondasGanadasPorMano =2.! !

!PartidaDeTruco methodsFor: 'intialize' stamp: 'AS 11/27/2023 21:00:36'!
ganoPie

	^rondasGanadasPorPie =2.! !

!PartidaDeTruco methodsFor: 'intialize' stamp: 'AS 11/27/2023 21:10:11'!
initializeRepartirCartasAMano: tresCartas repartirCartasAPie: otrasTresCartas 

	tresCartasMano := tresCartas.
	tresCartasPie := otrasTresCartas.
	rondaActual := RondaDeTrucoIniciaMano initializeParaPartida: self.
	ronda := 1.
	rondasGanadasPorMano := 0.
	rondasGanadasPorPie := 0.! !

!PartidaDeTruco methodsFor: 'intialize' stamp: 'AS 11/27/2023 21:10:01'!
laRondaLaGanoMano
	
	rondasGanadasPorMano := rondasGanadasPorMano +1.
	ronda := ronda + 1.
	rondaActual := RondaDeTrucoIniciaMano initializeParaPartida: self.! !

!PartidaDeTruco methodsFor: 'intialize' stamp: 'AS 11/27/2023 21:10:24'!
laRondaLaGanoPie
	
	rondasGanadasPorPie := rondasGanadasPorPie +1.
	ronda := ronda + 1.
	rondaActual := RondaDeTrucoIniciaPie initializeParaPartida: self.
! !

!PartidaDeTruco methodsFor: 'intialize' stamp: 'AS 11/27/2023 20:57:49'!
laRondaSeEmpardo

	ronda := ronda + 1.
! !

!PartidaDeTruco methodsFor: 'intialize' stamp: 'AS 11/27/2023 20:47:23'!
manoJuega: unaCarta

	self verificarQueManoPoseeEstaCarta: unaCarta.

	^rondaActual juegaMano: unaCarta.

	! !

!PartidaDeTruco methodsFor: 'intialize' stamp: 'AS 11/27/2023 20:46:57'!
pieJuega: unaCarta

	self verificarQuePiePoseeEstaCarta: unaCarta.

	^rondaActual juegaPie: unaCarta.! !

!PartidaDeTruco methodsFor: 'intialize' stamp: 'AS 11/27/2023 20:22:18'!
primeraRonda

	^ronda = 1.! !

!PartidaDeTruco methodsFor: 'intialize' stamp: 'AS 11/27/2023 20:54:25'!
segundaRonda

	^ronda=2! !

!PartidaDeTruco methodsFor: 'intialize' stamp: 'AS 11/27/2023 20:54:31'!
tercerRonda

	^ronda=3! !

!PartidaDeTruco methodsFor: 'intialize' stamp: 'AS 11/27/2023 20:47:13'!
verificarQueManoPoseeEstaCarta: unaCarta

	^ (tresCartasMano includes: unaCarta) ifFalse: [self error: self class jugadorNoPoseeEsaCartaErrorDescription]! !

!PartidaDeTruco methodsFor: 'intialize' stamp: 'AS 11/27/2023 20:47:04'!
verificarQuePiePoseeEstaCarta: unaCarta

	^ (tresCartasPie includes: unaCarta) ifFalse: [self error: self class jugadorNoPoseeEsaCartaErrorDescription]! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'PartidaDeTruco class' category: 'ISW1-2021-1C-2doParcial'!
PartidaDeTruco class
	instanceVariableNames: ''!

!PartidaDeTruco class methodsFor: 'instance creation' stamp: 'AS 11/27/2023 19:48:17'!
cantidadIncorrectaDeCartasErrorDescription

	^'No se puede crear una partida con cantidad de cartas incorrecta'! !

!PartidaDeTruco class methodsFor: 'instance creation' stamp: 'AS 11/27/2023 19:33:19'!
cartasRepetidasEnManosErrorDescription

	^'No se puede crear una partida con cartas repetidas'! !

!PartidaDeTruco class methodsFor: 'instance creation' stamp: 'AS 11/27/2023 20:44:49'!
jugadorNoPoseeEsaCartaErrorDescription

	^ 'No se puede jugar una carta que no se posee'! !

!PartidaDeTruco class methodsFor: 'instance creation' stamp: 'AS 11/27/2023 19:30:58'!
noEsTurnoDePieErrorDescription

	^'Es turno de el otro jugador'! !

!PartidaDeTruco class methodsFor: 'instance creation' stamp: 'AS 11/27/2023 19:38:58'!
noHayRepetidasEnEstasTres: tresCartas

	^ (tresCartas occurrencesOf: tresCartas first) = 1 and: [(tresCartas occurrencesOf: tresCartas second) = 1 and: [(tresCartas occurrencesOf: tresCartas third) = 1]]
! !

!PartidaDeTruco class methodsFor: 'instance creation' stamp: 'AS 11/27/2023 19:43:27'!
noHayRepetidasEntreEstasCartas: tresCartas yEstasCartas: otrasTresCartas.
	
	(self noHayRepetidasEnEstasTres: tresCartas) ifFalse: [self error: self cartasRepetidasEnManosErrorDescription ].
	(self noHayRepetidasEnEstasTres: otrasTresCartas) ifFalse: [self error: self cartasRepetidasEnManosErrorDescription ].
	(self noHayRepetidasEntreSiEntre: tresCartas y: otrasTresCartas ) ifFalse: [self error: self cartasRepetidasEnManosErrorDescription ]. ! !

!PartidaDeTruco class methodsFor: 'instance creation' stamp: 'AS 11/27/2023 19:46:40'!
noHayRepetidasEntreSiEntre: tresCartas y: otrasTresCartas 

	tresCartas detect: [:unaCarta| otrasTresCartas includes: unaCarta ] ifNone: [^true].
	^false! !

!PartidaDeTruco class methodsFor: 'instance creation' stamp: 'AS 11/27/2023 19:53:50'!
repartirCartasAMano: tresCartas repartirCartasAPie: otrasTresCartas 

	self verificarQueSonTresCartas: tresCartas.
	
	self verificarQueSonTresCartas: otrasTresCartas.
	
	self noHayRepetidasEntreEstasCartas: tresCartas yEstasCartas: otrasTresCartas.
	
	^self new initializeRepartirCartasAMano: tresCartas repartirCartasAPie: otrasTresCartas ! !

!PartidaDeTruco class methodsFor: 'instance creation' stamp: 'AS 11/27/2023 19:53:41'!
verificarQueSonTresCartas: unasCartas

	^ unasCartas size = 3 ifFalse: [self error: self cantidadIncorrectaDeCartasErrorDescription ]! !


!classDefinition: #RondaDeTruco category: 'ISW1-2021-1C-2doParcial'!
Object subclass: #RondaDeTruco
	instanceVariableNames: 'manoJugo pieJugo partida'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-2021-1C-2doParcial'!

!RondaDeTruco methodsFor: 'as yet unclassified' stamp: 'AS 11/27/2023 20:29:37'!
intializeWithPartida: unaPartida 

	partida := unaPartida .
	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'RondaDeTruco class' category: 'ISW1-2021-1C-2doParcial'!
RondaDeTruco class
	instanceVariableNames: ''!


!RondaDeTruco class methodsFor: 'as yet unclassified' stamp: 'AS 11/27/2023 20:28:04'!
initializeJuegaManoParaPartida: unaPartida

	^RondaDeTrucoIniciaMano new intializeWithPartida: unaPartida ! !

!RondaDeTruco class methodsFor: 'as yet unclassified' stamp: 'AS 11/27/2023 20:21:31'!
noEsTurnoDePieErrorDescription

	^'No es turno de pie de jugar'! !


!classDefinition: #RondaDeTrucoIniciaMano category: 'ISW1-2021-1C-2doParcial'!
RondaDeTruco subclass: #RondaDeTrucoIniciaMano
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-2021-1C-2doParcial'!

!RondaDeTrucoIniciaMano methodsFor: 'as yet unclassified' stamp: 'AS 11/27/2023 21:02:48'!
juegaMano: unaCarta

	manoJugo := unaCarta.! !

!RondaDeTrucoIniciaMano methodsFor: 'as yet unclassified' stamp: 'AS 11/27/2023 20:25:43'!
juegaPie: unaCarta

	manoJugo ifNil: [self error: self class noEsTurnoDePieErrorDescription ].
	
	pieJugo := unaCarta.
	
	self terminarRonda.! !

!RondaDeTrucoIniciaMano methodsFor: 'as yet unclassified' stamp: 'AS 11/27/2023 20:37:41'!
terminarRonda

	(manoJugo mataA: pieJugo) ifTrue: [^partida laRondaLaGanoMano].
	(manoJugo empardaCon: pieJugo) ifTrue: [^partida laRondaSeEmpardo].
	^partida laRondaLaGanoPie.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'RondaDeTrucoIniciaMano class' category: 'ISW1-2021-1C-2doParcial'!
RondaDeTrucoIniciaMano class
	instanceVariableNames: ''!

!RondaDeTrucoIniciaMano class methodsFor: 'as yet unclassified' stamp: 'AS 11/27/2023 21:10:54'!
initializeParaPartida: unaPartida

	^self new intializeWithPartida: unaPartida ! !


!classDefinition: #RondaDeTrucoIniciaPie category: 'ISW1-2021-1C-2doParcial'!
RondaDeTruco subclass: #RondaDeTrucoIniciaPie
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-2021-1C-2doParcial'!

!RondaDeTrucoIniciaPie methodsFor: 'as yet unclassified' stamp: 'AS 11/27/2023 21:12:48'!
juegaMano: unaCarta

	pieJugo ifNil: [self error: self class noEsTurnoDePieErrorDescription ].
	
	manoJugo := unaCarta.
	
	self terminarRonda.! !

!RondaDeTrucoIniciaPie methodsFor: 'as yet unclassified' stamp: 'AS 11/27/2023 21:12:31'!
juegaPie: unaCarta

	pieJugo := unaCarta.! !

!RondaDeTrucoIniciaPie methodsFor: 'as yet unclassified' stamp: 'AS 11/27/2023 21:12:55'!
terminarRonda

	(manoJugo mataA: pieJugo) ifTrue: [^partida laRondaLaGanoMano].
	(manoJugo empardaCon: pieJugo) ifTrue: [^partida laRondaSeEmpardo].
	^partida laRondaLaGanoPie.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'RondaDeTrucoIniciaPie class' category: 'ISW1-2021-1C-2doParcial'!
RondaDeTrucoIniciaPie class
	instanceVariableNames: ''!

!RondaDeTrucoIniciaPie class methodsFor: 'as yet unclassified' stamp: 'AS 11/27/2023 21:10:58'!
initializeParaPartida: unaPartida

	^self new intializeWithPartida: unaPartida ! !
