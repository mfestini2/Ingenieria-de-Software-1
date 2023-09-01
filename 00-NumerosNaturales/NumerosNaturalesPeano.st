!classDefinition: #I category: 'Peano'!
DenotativeObject subclass: #I
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Peano'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'I class' category: 'Peano'!
I class
	instanceVariableNames: 'next'!

!I class methodsFor: 'operaciones' stamp: 'AS 8/27/2023 16:42:40'!
* aNaturalNumber
	
	^ aNaturalNumber! !

!I class methodsFor: 'operaciones' stamp: 'AS 8/24/2023 21:01:23'!
+ aNaturalNumber
	
	^ aNaturalNumber next! !

!I class methodsFor: 'operaciones' stamp: 'AS 8/28/2023 21:43:59'!
- aNaturalNumber
	
	^ self error: self descripcionDeErrorDeNumerosNegativosNoSoportados
	! !

!I class methodsFor: 'operaciones' stamp: 'AS 8/31/2023 20:24:52'!
/ aNaturalNumber

	self = aNaturalNumber ifTrue: [^I].
	^ self error: self descripcionDeErrorDeNoSePuedeDividirPorUnNumeroMayor! !

!I class methodsFor: 'operaciones' stamp: 'AS 8/28/2023 21:57:44'!
> aNaturalNumber

	^ false
	
! !


!I class methodsFor: 'errores' stamp: 'AS 8/28/2023 21:59:17'!
descripcionDeErrorDeNoSePuedeDividirPorUnNumeroMayor
	
	^ 'No se puede dividir por un numero más grande'! !

!I class methodsFor: 'errores' stamp: 'AS 8/28/2023 21:43:13'!
descripcionDeErrorDeNumerosNegativosNoSoportados
	
	^ 'No se puede restar algo a I'! !


!I class methodsFor: 'axiomas' stamp: 'AS 8/24/2023 20:58:45'!
next
	
	next ifNotNil: [^next].
	next := self cloneNamed: self name, 'I'.
	^ next
	! !


!I class methodsFor: 'delegadores' stamp: 'AS 8/27/2023 17:09:56'!
dividiteA: aNaturalNumber
	
	^ aNaturalNumber! !

!I class methodsFor: 'delegadores' stamp: 'AS 8/24/2023 21:57:05'!
restateA: aNaturalNumber
	
	^ aNaturalNumber previous! !


!I class methodsFor: '--** private fileout/in **--' stamp: 'AS 8/31/2023 20:33:07'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := II.! !


!classDefinition: #II category: 'Peano'!
DenotativeObject subclass: #II
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Peano'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'II class' category: 'Peano'!
II class
	instanceVariableNames: 'next previous'!

!II class methodsFor: 'operaciones' stamp: 'AS 8/27/2023 17:05:21'!
* aNaturalNumber
	
	^aNaturalNumber + (aNaturalNumber * self previous)! !

!II class methodsFor: 'operaciones' stamp: 'AS 8/24/2023 21:10:18'!
+ aNaturalNumber
	
	^ self previous + aNaturalNumber next! !

!II class methodsFor: 'operaciones' stamp: 'AS 8/31/2023 20:23:20'!
- aNaturalNumber

	^ aNaturalNumber restateA: self
	! !

!II class methodsFor: 'operaciones' stamp: 'AS 8/28/2023 21:58:35'!
/ aNaturalNumber
		
	aNaturalNumber > self ifTrue: [^ self error: self descripcionDeErrorDeNoSePuedeDividirPorUnNumeroMayor].
	self = aNaturalNumber ifTrue: [^I].
	^ I + ((self - aNaturalNumber) / aNaturalNumber)! !

!II class methodsFor: 'operaciones' stamp: 'AS 8/28/2023 21:54:08'!
> aNaturalNumber
	
	self = aNaturalNumber ifTrue: [ ^ false].
	aNaturalNumber = I ifTrue: [ ^ true].
	self = I ifTrue: [ ^ false].
	^ ((self previous) > (aNaturalNumber previous))
	
! !


!II class methodsFor: 'axiomas' stamp: 'AS 8/28/2023 21:42:03'!
next
	
	next ifNotNil: [^next].
	next := II createChildNamed: self name, 'I'.
	next previous: self.
	^ next
	! !

!II class methodsFor: 'axiomas' stamp: 'AS 8/24/2023 21:21:10'!
previous
	
	^ previous! !


!II class methodsFor: 'asignador' stamp: 'AS 8/24/2023 21:21:21'!
previous: aNaturalNumber
	
	previous := aNaturalNumber! !


!II class methodsFor: 'delegadores' stamp: 'AS 8/27/2023 17:18:46'!
dividiteA: aNaturalNumber
	
	^ aNaturalNumber / self! !

!II class methodsFor: 'delegadores' stamp: 'AS 8/24/2023 21:55:33'!
restateA: aNaturalNumber
	
	^aNaturalNumber previous - self previous! !


!II class methodsFor: 'errores' stamp: 'AS 8/28/2023 21:52:15'!
descripcionDeErrorDeNoSePuedeDividirPorUnNumeroMayor
	
	^ 'No se puede dividir por un numero más grande'! !


!II class methodsFor: '--** private fileout/in **--' stamp: 'AS 8/31/2023 20:33:07'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := III.
	previous := I.! !


!classDefinition: #III category: 'Peano'!
II subclass: #III
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Peano'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'III class' category: 'Peano'!
III class
	instanceVariableNames: ''!

!III class methodsFor: '--** private fileout/in **--' stamp: 'AS 8/31/2023 20:33:07'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := IIII.
	previous := II.! !


!classDefinition: #IIII category: 'Peano'!
II subclass: #IIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Peano'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'IIII class' category: 'Peano'!
IIII class
	instanceVariableNames: ''!

!IIII class methodsFor: '--** private fileout/in **--' stamp: 'AS 8/31/2023 20:33:07'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := nil.
	previous := III.! !

I initializeAfterFileIn!
II initializeAfterFileIn!
III initializeAfterFileIn!
IIII initializeAfterFileIn!