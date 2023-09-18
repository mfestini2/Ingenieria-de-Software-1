!classDefinition: #OOStackTest category: 'Stack-Exercise'!
TestCase subclass: #OOStackTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStackTest methodsFor: 'test' stamp: 'HernanWilkinson 5/7/2012 11:30'!
test01StackShouldBeEmptyWhenCreated

	| stack |
	
	stack := OOStack new.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:29:55'!
test02PushAddElementsToTheStack

	| stack |
	
	stack := OOStack new.
	stack push: 'something'.
	
	self deny: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:01'!
test03PopRemovesElementsFromTheStack

	| stack |
	
	stack := OOStack new.
	stack push: 'something'.
	stack pop.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:09'!
test04PopReturnsLastPushedObject

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	stack push: pushedObject.
	
	self assert: stack pop = pushedObject! !

!OOStackTest methodsFor: 'test' stamp: 'NR 9/16/2021 17:40:17'!
test05StackBehavesLIFO

	| stack firstPushedObject secondPushedObject |
	
	stack := OOStack new.
	firstPushedObject := 'firstSomething'.
	secondPushedObject := 'secondSomething'.
	
	stack push: firstPushedObject.
	stack push: secondPushedObject.
	
	self assert: stack pop = secondPushedObject.
	self assert: stack pop = firstPushedObject.
	self assert: stack isEmpty 
	! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:20'!
test06TopReturnsLastPushedObject

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: stack top = pushedObject.
	! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:24'!
test07TopDoesNotRemoveObjectFromStack

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: stack size = 1.
	stack top.
	self assert: stack size = 1.
	! !

!OOStackTest methodsFor: 'test' stamp: 'HAW 4/14/2017 22:48:26'!
test08CanNotPopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOStack new.
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:31'!
test09CanNotPopWhenThereAreNoObjectsInTheStackAndTheStackHadObjects

	| stack  |
	
	stack := OOStack new.
	stack push: 'something'.
	stack pop.
	
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !

!OOStackTest methodsFor: 'test' stamp: 'HAW 4/14/2017 22:48:44'!
test10CanNotTopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOStack new.
	self
		should: [ stack top ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !


!classDefinition: #SentenceFinderByPrefixTest category: 'Stack-Exercise'!
TestCase subclass: #SentenceFinderByPrefixTest
	instanceVariableNames: 'sentenceFinder stack'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SentenceFinderByPrefixTest methodsFor: 'setup' stamp: 'asd 9/16/2023 18:33:08'!
setUp

	sentenceFinder := SentenceFinderByPrefix new.
	stack := OOStack new.! !


!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'asd 9/16/2023 18:34:05'!
test01StringIsPrefixOfString2
	
	self assert: (sentenceFinder isPrefix: 'String' of: 'String2')! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'asd 9/16/2023 18:33:18'!
test02IsPrefixOfIsCaseSensitive
	
	self deny: (sentenceFinder isPrefix: 'string' of: 'String2')! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'asd 9/16/2023 18:33:21'!
test03BiggerStringIsntPrefix
	
	self deny: (sentenceFinder isPrefix: 'String' of: 'Strin')! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'asd 9/16/2023 18:33:23'!
test04StringIsPrefixOfItself
	
	self assert: (sentenceFinder isPrefix: 'String' of: 'String')! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'as 9/17/2023 00:54:11'!
test05EmptyStackReturnsEmptyCollection

	| aCollection |
	
	aCollection:= OrderedCollection new.
	
	self assert: aCollection = (sentenceFinder findAllIn: stack withPrefix: 'abc')! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'asd 9/16/2023 19:18:39'!
test06EmptyPrefixRaisesError
	
	self
		should: [ sentenceFinder findAllIn: stack withPrefix: '' ]
		raise: Error 
		withExceptionDo: [ :anError |
			self assert: anError messageText = SentenceFinderByPrefix emptyPrefix ]! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'asd 9/16/2023 19:29:51'!
test07PrefixWithSpacesRaisesError
	
	self
		should: [ sentenceFinder findAllIn: stack withPrefix: ' ' ]
		raise: Error 
		withExceptionDo: [ :anError |
			self assert: anError messageText = SentenceFinderByPrefix prefixWithSpaces ]
		
	"Ignora lo que le mande al detect en raiseInvalidPrefix"! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'asd 9/16/2023 19:18:45'!
test08ProblemFromStatementGivesExpectedResult

	| aCollection |
	
	aCollection:= OrderedCollection new.
	aCollection add: 'Winter is here'.
	
	stack push: 'winter is coming'.
	stack push: 'winning is everything'.
	stack push: 'The winds of Winter'.
	stack push: 'Winter is here'.
	
	self assert: aCollection = (sentenceFinder findAllIn: stack withPrefix: 'Wint')! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'asd 9/16/2023 19:28:48'!
test09StackIsUnchanged

	| aStack |
	
	stack push: 'winter is coming'.
	stack push: 'winning is everything'.
	stack push: 'The winds of Winter'.
	stack push: 'Winter is here'.
	
	aStack := stack.
	
	sentenceFinder findAllIn: stack withPrefix: 'Wint'.
	
	self assert: aStack = stack.! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'asd 9/16/2023 19:31:31'!
test10SentenceFinderIsReusable

	| aCollection |
	
	stack push: 'winter is coming'.
	stack push: 'winning is everything'.
	stack push: 'The winds of Winter'.
	stack push: 'Winter is here'.
	
	sentenceFinder findAllIn: stack withPrefix: 'Wint'.
	aCollection := sentenceFinder findAllIn: stack withPrefix: 'win'.
	
	self assert: aCollection size = 2.! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'as 9/17/2023 00:53:10'!
test11PrefixWithSpacesAtTheEnd
	
	self
		should: [ sentenceFinder findAllIn: stack withPrefix: 'sssssssssssss ' ]
		raise: Error 
		withExceptionDo: [ :anError |
			self assert: anError messageText = SentenceFinderByPrefix prefixWithSpaces ]
		
	"Ignora lo que le mande al detect en raiseInvalidPrefix"! !


!classDefinition: #EmptyContainer category: 'Stack-Exercise'!
Object subclass: #EmptyContainer
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!EmptyContainer methodsFor: 'comparison' stamp: 'asd 9/16/2023 01:31:34'!
isEmpty

	^true! !


!EmptyContainer methodsFor: 'error handling' stamp: 'asd 9/16/2023 03:18:02'!
raiseIfEmpty: anOOStack

	^anOOStack raiseEmpty! !


!classDefinition: #NonEmptyContainer category: 'Stack-Exercise'!
Object subclass: #NonEmptyContainer
	instanceVariableNames: 'state value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!NonEmptyContainer methodsFor: 'initialization' stamp: 'asd 9/16/2023 15:49:11'!
initializeWith: aValue and: aState

	state := aState.
	value := aValue.! !


!NonEmptyContainer methodsFor: 'operations' stamp: 'asd 9/16/2023 02:07:20'!
pop

	^ state! !

!NonEmptyContainer methodsFor: 'operations' stamp: 'asd 9/16/2023 03:22:08'!
top

	^ value! !


!NonEmptyContainer methodsFor: 'error handling' stamp: 'asd 9/16/2023 15:50:00'!
raiseIfEmpty: anOOStack

	"Para mantener el poliformismo con EmptyContainer"! !


!NonEmptyContainer methodsFor: 'comparison' stamp: 'asd 9/16/2023 01:33:46'!
isEmpty

	^ false! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'NonEmptyContainer class' category: 'Stack-Exercise'!
NonEmptyContainer class
	instanceVariableNames: ''!

!NonEmptyContainer class methodsFor: 'as yet unclassified' stamp: 'asd 9/16/2023 01:55:18'!
with: aValue and: aState

	^ self new initializeWith: aValue and: aState! !


!classDefinition: #OOStack category: 'Stack-Exercise'!
Object subclass: #OOStack
	instanceVariableNames: 'state size'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStack methodsFor: 'operations' stamp: 'asd 9/16/2023 15:46:13'!
pop
	
	| value |
	
	state raiseIfEmpty: self.
	
	value := state top.
	state := state pop.
	size := size-1.
	^ value! !

!OOStack methodsFor: 'operations' stamp: 'asd 9/16/2023 15:48:25'!
push: anElement

	state := NonEmptyContainer with: anElement and: state.
	size := size+1.! !

!OOStack methodsFor: 'operations' stamp: 'asd 9/16/2023 02:04:58'!
size
	
	^ size! !

!OOStack methodsFor: 'operations' stamp: 'asd 9/16/2023 15:48:42'!
top
	
	state raiseIfEmpty: self.
	^state top! !


!OOStack methodsFor: 'error handling' stamp: 'asd 9/16/2023 15:48:31'!
raiseEmpty

	^ self error: self class stackEmptyErrorDescription.! !


!OOStack methodsFor: 'comparison' stamp: 'asd 9/16/2023 01:30:19'!
isEmpty

	^ state isEmpty! !


!OOStack methodsFor: 'initialization' stamp: 'asd 9/16/2023 02:03:59'!
initialize

	state := EmptyContainer new.
	size := 0.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStack class' category: 'Stack-Exercise'!
OOStack class
	instanceVariableNames: ''!

!OOStack class methodsFor: 'error descriptions' stamp: 'NR 9/14/2023 08:12:21'!
stackEmptyErrorDescription
	
	^ 'stack is empty!!!!!!'! !


!classDefinition: #SentenceFinderByPrefix category: 'Stack-Exercise'!
Object subclass: #SentenceFinderByPrefix
	instanceVariableNames: 'collection stack'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SentenceFinderByPrefix methodsFor: 'error handling' stamp: 'as 9/17/2023 00:50:14'!
raiseInvalidPrefix: aPrefix

	| emptyString |
	emptyString:= ''.

	(emptyString = aPrefix) ifTrue: [^self error: self class emptyPrefix].
	(aPrefix detect: [:each  | each = $ ] ifNone: [^[] value]). "No sabia como hacer que saliera del contexto asi como asi"
	^ self error: self class prefixWithSpaces
	! !


!SentenceFinderByPrefix methodsFor: 'assist methods' stamp: 'asd 9/16/2023 18:24:30'!
copyFrom: anOOStack ifPrefixedBy: aPrefix

	(anOOStack isEmpty) ifFalse: [ | value |
							 value:= anOOStack pop.
							 stack push: value.
							 (self isPrefix: aPrefix of: value) ifTrue: [collection add: value].
							 self copyFrom: anOOStack ifPrefixedBy: aPrefix]! !


!SentenceFinderByPrefix methodsFor: 'element comparison' stamp: 'asd 9/16/2023 17:21:01'!
isPrefix: aPrefix of: aString

	(self prefix: aPrefix fitsIn: aString) ifTrue: [^ aPrefix = (aString allButLast: (self sizeDifferenceOf: aPrefix and: aString))].
	
	^ false! !

!SentenceFinderByPrefix methodsFor: 'element comparison' stamp: 'asd 9/16/2023 16:57:39'!
prefix: aPrefix fitsIn: aString

	^ aPrefix size <= aString size! !

!SentenceFinderByPrefix methodsFor: 'element comparison' stamp: 'asd 9/16/2023 17:00:37'!
sizeDifferenceOf: aPrefix and: aString

	^ aString size - aPrefix size! !


!SentenceFinderByPrefix methodsFor: 'restore' stamp: 'asd 9/18/2023 14:32:54'!
invertStack: aRecieverOOStack

	(stack isEmpty) ifFalse: [ aRecieverOOStack push: (stack pop).
		                                    self invertStack: aRecieverOOStack.]! !

!SentenceFinderByPrefix methodsFor: 'restore' stamp: 'asd 9/16/2023 17:58:28'!
restore: aRecieverOOStack

	collection := OrderedCollection new.
	self invertStack: aRecieverOOStack.! !


!SentenceFinderByPrefix methodsFor: 'operations' stamp: 'asd 9/16/2023 19:17:52'!
findAllIn: anOOStack withPrefix: aPrefix

	| aCollection |
	
	self raiseInvalidPrefix: aPrefix.
	
	self copyFrom: anOOStack ifPrefixedBy: aPrefix.
	
	aCollection := collection.
	self restore: anOOStack.
	
	^ aCollection
	! !


!SentenceFinderByPrefix methodsFor: 'initialization' stamp: 'asd 9/16/2023 17:54:36'!
initialize

	collection := OrderedCollection new.
	stack := OOStack new.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'SentenceFinderByPrefix class' category: 'Stack-Exercise'!
SentenceFinderByPrefix class
	instanceVariableNames: ''!

!SentenceFinderByPrefix class methodsFor: 'as yet unclassified' stamp: 'asd 9/16/2023 19:14:37'!
emptyPrefix

	^ 'The prefix cannot be the empty string'! !

!SentenceFinderByPrefix class methodsFor: 'as yet unclassified' stamp: 'asd 9/16/2023 19:14:49'!
prefixWithSpaces

	^ 'The prefix cannot have spaces'! !
