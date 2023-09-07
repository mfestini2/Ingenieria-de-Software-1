!classDefinition: #CantSuspend category: 'CodigoRepetido-Ejercicio'!
Error subclass: #CantSuspend
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!


!classDefinition: #NotFound category: 'CodigoRepetido-Ejercicio'!
Error subclass: #NotFound
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!


!classDefinition: #CustomerBookTest category: 'CodigoRepetido-Ejercicio'!
TestCase subclass: #CustomerBookTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!

!CustomerBookTest methodsFor: 'testing' stamp: 'MF 9/5/2023 11:56:15'!
test01AddingCustomerShouldNotTakeMoreThan50Milliseconds

	| customerBook |
	
	customerBook := CustomerBook new.
	
	self verify: [customerBook addCustomerNamed: 'John Lennon'] runsInLessThan: (50 * millisecond)
	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'as 9/6/2023 23:34:16'!
test02RemovingCustomerShouldNotTakeMoreThan100Milliseconds

	| customerBook paulMcCartney |
	
	
	paulMcCartney := 'Paul McCartney'.
	customerBook := self setUpBookWithCustomerNamed: paulMcCartney.
	
	self verify: [customerBook removeCustomerNamed: paulMcCartney] runsInLessThan: (100 * millisecond)
	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'AS 9/5/2023 20:10:52'!
test03CanNotAddACustomerWithEmptyName 

	| customerBook |
			
	customerBook := CustomerBook new.

	self run: [customerBook addCustomerNamed: ''] andOn: Error verify: (self customerBookIsEmpty: customerBook)! !

!CustomerBookTest methodsFor: 'testing' stamp: 'as 9/6/2023 23:34:09'!
test04CanNotRemoveAnInvalidCustomer
	
	| customerBook johnLennon |

	johnLennon := 'John Lennon'.
	customerBook := self setUpBookWithCustomerNamed: johnLennon.
	
	self run: [customerBook removeCustomerNamed: 'Paul McCartney'] andOn: NotFound verify: (self customerBook: customerBook justIncludes: johnLennon)
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'as 9/6/2023 23:33:44'!
test05SuspendingACustomerShouldNotRemoveItFromCustomerBook

	| customerBook paulMcCartney expectedValues |
	
	paulMcCartney := 'Paul McCartney'.
	customerBook := self setUpBookWithCustomerNamed: paulMcCartney.
	customerBook suspendCustomerNamed: paulMcCartney.
	
	expectedValues := Bag with:0 with:1 with:1.
	
	self verifyExpectedValues: expectedValues areCorrectForBook: customerBook.
	self assert: (customerBook includesCustomerNamed: paulMcCartney).
	

	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'as 9/6/2023 23:34:53'!
test06RemovingASuspendedCustomerShouldRemoveItFromCustomerBook

	| customerBook paulMcCartney expectedValues|
	
	paulMcCartney := 'Paul McCartney'.
	
	customerBook := self setUpBookWithCustomerNamed: paulMcCartney.
	customerBook suspendCustomerNamed: paulMcCartney.
	customerBook removeCustomerNamed: paulMcCartney.
	
	expectedValues := Bag with:0 with:0 with:0.
	
	self verifyExpectedValues: expectedValues areCorrectForBook: customerBook.
	self deny: (customerBook includesCustomerNamed: paulMcCartney).


	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'as 9/6/2023 23:53:43'!
test07CanNotSuspendAnInvalidCustomer
	
	| customerBook johnLennon |
			
	johnLennon := 'John Lennon'.
	customerBook := self setUpBookWithCustomerNamed: johnLennon.
	
	self assertSuspending: 'George Harrison' fromBook: customerBook shouldRaise: CantSuspend andJustInclude: johnLennon

! !

!CustomerBookTest methodsFor: 'testing' stamp: 'as 9/6/2023 23:53:50'!
test08CanNotSuspendAnAlreadySuspendedCustomer
	
	| customerBook johnLennon |
			
	johnLennon := 'John Lennon'.
	customerBook := self setUpBookWithCustomerNamed: johnLennon.
	customerBook suspendCustomerNamed: johnLennon.
	
	self assertSuspending: johnLennon fromBook: customerBook shouldRaise: CantSuspend andJustInclude: johnLennon
! !


!CustomerBookTest methodsFor: 'testHelpers' stamp: 'as 9/6/2023 23:52:10'!
assertSuspending: aName fromBook: customerBook shouldRaise: error andJustInclude: anotherName

	self run: [ customerBook suspendCustomerNamed: 'George Harrison'. self fail ] andOn: CantSuspend verify: (self customerBook: customerBook justIncludes: anotherName)
	
! !

!CustomerBookTest methodsFor: 'testHelpers' stamp: 'AS 9/5/2023 20:14:06'!
customerBook: customerBook justIncludes: name

	^ [customerBook numberOfCustomers = 1. 
		(customerBook includesCustomerNamed: name)]
	
! !

!CustomerBookTest methodsFor: 'testHelpers' stamp: 'AS 9/5/2023 20:11:58'!
customerBookIsEmpty: customerBook

	^ [:anError | customerBook isEmpty.
	anError messageText = CustomerBook customerCanNotBeEmptyErrorMessage]
	
! !

!CustomerBookTest methodsFor: 'testHelpers' stamp: 'AS 9/5/2023 21:53:45'!
run: aClosure andOn: anEvent verify:anotherClosure

	aClosure
		on:  anEvent
		do: anotherClosure! !

!CustomerBookTest methodsFor: 'testHelpers' stamp: 'MF 9/5/2023 11:45:45'!
runAndTime: aClosure

	| millisecondsAfterRunning millisecondsBeforeRunning |
	
	millisecondsBeforeRunning := Time millisecondClockValue * millisecond.
	aClosure value.
	millisecondsAfterRunning := Time millisecondClockValue * millisecond.
	^millisecondsAfterRunning-millisecondsBeforeRunning

	
! !

!CustomerBookTest methodsFor: 'testHelpers' stamp: 'as 9/6/2023 23:33:51'!
setUpBookWithCustomerNamed: aName

	|customerBook|
	customerBook := CustomerBook new.
	customerBook addCustomerNamed: aName.
	
	^customerBook
	
! !

!CustomerBookTest methodsFor: 'testHelpers' stamp: 'as 9/6/2023 23:51:14'!
suspend: aName fromBook: customerBook shouldRaise: error andJustInclude: anotherName

	self run: [ customerBook suspendCustomerNamed: 'George Harrison'. self fail ] andOn: CantSuspend verify: (self customerBook: customerBook justIncludes: anotherName)
	
! !

!CustomerBookTest methodsFor: 'testHelpers' stamp: 'MF 9/5/2023 11:55:48'!
verify: aClosure runsInLessThan: aTime

	self assert: (self runAndTime: aClosure) < (aTime)
	
! !

!CustomerBookTest methodsFor: 'testHelpers' stamp: 'AS 9/5/2023 21:51:47'!
verifyExpectedValues: values areCorrectForBook: customerBook
	| realValues |

	realValues := Bag new.

	realValues add: customerBook numberOfActiveCustomers.
	realValues add: customerBook numberOfSuspendedCustomers.
	realValues add: customerBook numberOfCustomers.
	
	^ self verifyObject: values equalsObject: realValues
	
	! !

!CustomerBookTest methodsFor: 'testHelpers' stamp: 'AS 9/5/2023 20:35:18'!
verifyObject: firstObject equalsObject: secondObject
	
	^ self assert: firstObject = secondObject! !


!classDefinition: #CustomerBook category: 'CodigoRepetido-Ejercicio'!
Object subclass: #CustomerBook
	instanceVariableNames: 'suspended active'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!

!CustomerBook methodsFor: 'testing' stamp: 'NR 4/3/2019 10:14:26'!
includesCustomerNamed: aName

	^(active includes: aName) or: [ suspended includes: aName ]! !

!CustomerBook methodsFor: 'testing' stamp: 'NR 4/3/2019 10:14:26'!
isEmpty
	
	^active isEmpty and: [ suspended isEmpty ]! !


!CustomerBook methodsFor: 'initialization' stamp: 'NR 9/17/2020 07:23:04'!
initialize

	active := OrderedCollection new.
	suspended:= OrderedCollection new.! !


!CustomerBook methodsFor: 'customer management' stamp: 'as 9/6/2023 23:24:55'!
addCustomerNamed: aName

	aName isEmpty ifTrue: [ self signalCustomerNameCannotBeEmpty ].
	(self includesCustomerNamed: aName) ifTrue: [ self signalCustomerAlreadyExists ].
	
	active add: aName ! !

!CustomerBook methodsFor: 'customer management' stamp: 'NR 4/3/2019 10:14:26'!
numberOfActiveCustomers
	
	^active size! !

!CustomerBook methodsFor: 'customer management' stamp: 'NR 4/3/2019 10:14:26'!
numberOfCustomers
	
	^active size + suspended size! !

!CustomerBook methodsFor: 'customer management' stamp: 'NR 9/19/2018 17:36:09'!
numberOfSuspendedCustomers
	
	^suspended size! !

!CustomerBook methodsFor: 'customer management' stamp: 'as 9/7/2023 00:09:20'!
remove: anElement fromCollection: aCollection ifNotInCollection: aClosure
 
	1 to: aCollection size do:
	[ :index |
		anElement = (aCollection at: index)
			ifTrue: [
				aCollection removeAt: index.
				^ anElement
			] 
	].
	^aClosure value

! !

!CustomerBook methodsFor: 'customer management' stamp: 'as 9/7/2023 00:09:12'!
removeCustomerNamed: aName 

	^ self remove: aName fromCollection: active ifNotInCollection: [^ self remove: aName fromCollection: suspended ifNotInCollection:[^NotFound signal]]
! !

!CustomerBook methodsFor: 'customer management' stamp: 'HernanWilkinson 7/6/2011 17:52'!
signalCustomerAlreadyExists 

	self error: self class customerAlreadyExistsErrorMessage! !

!CustomerBook methodsFor: 'customer management' stamp: 'HernanWilkinson 7/6/2011 17:51'!
signalCustomerNameCannotBeEmpty 

	self error: self class customerCanNotBeEmptyErrorMessage ! !

!CustomerBook methodsFor: 'customer management' stamp: 'NR 4/3/2019 10:14:26'!
suspendCustomerNamed: aName 
	
	(active includes: aName) ifFalse: [^CantSuspend signal].
	
	active remove: aName.
	
	suspended add: aName
! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CustomerBook class' category: 'CodigoRepetido-Ejercicio'!
CustomerBook class
	instanceVariableNames: ''!

!CustomerBook class methodsFor: 'error messages' stamp: 'NR 9/4/2023 17:02:48'!
customerAlreadyExistsErrorMessage

	^'Customer already exists!!!!!!'! !

!CustomerBook class methodsFor: 'error messages' stamp: 'NR 9/4/2023 17:02:52'!
customerCanNotBeEmptyErrorMessage

	^'Customer name cannot be empty!!!!!!'! !
