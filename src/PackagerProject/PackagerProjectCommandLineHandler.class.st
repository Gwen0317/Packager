Class {
	#name : 'PackagerProjectCommandLineHandler',
	#superclass : 'CommandLineHandler',
	#category : 'PackagerProject',
	#package : 'PackagerProject'
}

{ #category : 'accessing' }
PackagerProjectCommandLineHandler class >> commandName [

	^ 'packager'
]

{ #category : 'activation' }
PackagerProjectCommandLineHandler >> activate [
	
	| space |
	OSWindowDriver current startUp: true.
	AppGeneratorSupport errorHandler: AppGeneratorSDLMessageErrorHandler new.

	space := ProjectClass StartMethod.

"	space title: 'Application'.
	space
				addEventHandlerOn: BlSpaceClosedEvent
				do: [ :e | Smalltalk snapshot: false andQuit: true ]."
]
