Class {
	#name : 'PackagerProject',
	#superclass : 'Object',
	#category : 'PackagerProject',
	#package : 'PackagerProject'
}

{ #category : 'generation' }
PackagerProject class >> generateWindowsPackage [

	<script>

	| command p drive rest unixPath dirPath lastSlashPos text |

	AppGeneratorWindowsGenerator new
		properties: {
			#AppName -> 'Demo'.
			#InfoString -> 'An application written in Pharo'.
			#BundleIdentifier -> 'org.pharo.packager'.
			#ShortVersion -> '1.0.0'.
			#DisplayName -> 'Projet'.
			#CommandLineHandler -> 'packager'.
"			#IconFile -> self iconFile."
			#CompanyName -> 'Pharo Consortium'.
			#LegalCopyright -> 'Copyright \251 https://www.pharo.org 2023\0'.
		} asDictionary;
		outputDirectory: FileLocator workingDirectory / 'build';
		generate.
		
	"Ouverture de MSYS2"
	command := SmockWinProcessManager 
	prepareCommand: 'C:\msys64\mingw64.exe'
	arguments: {  } 
	inDir: 'C:\msys64\' asFileReference
	noWindow: false 
	callbackBlock: [ ].
	command run.

	"Commande à copier"
	p := Smalltalk imagePath asString.
	drive := (p copyFrom: 1 to: 1) asLowercase.
	rest := p copyFrom: 3 to: p size.
	unixPath := '/' , drive , rest.
	unixPath := unixPath copyReplaceAll: '\' with: '/'.
	lastSlashPos := unixPath lastIndexOf: $/.
	dirPath := unixPath copyFrom: 1 to: lastSlashPos.
	Transcript clear.
	Transcript open. 
	Transcript show: 'cd '.
	Transcript show: dirPath. 
	Transcript show: 'build && cmake . && ninja'.
	text := 'cd ',dirPath,'build && cmake . && ninja'.
	Clipboard clipboardText: text.
]

{ #category : 'resources' }
PackagerProject class >> iconFile [
		
	^ AppGeneratorAbstractGenerator repositoryLocation / 'exampleResources' / 'ballon.ico'
]
