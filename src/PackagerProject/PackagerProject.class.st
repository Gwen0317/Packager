Class {
	#name : 'PackagerProject',
	#superclass : 'Object',
	#category : 'PackagerProject',
	#package : 'PackagerProject'
}

{ #category : 'generation' }
PackagerProject class >> generateOSXPackage [

	<script>

	AppGeneratorOSXGenerator new
		properties: {
			#AppName -> 'Demo'.
			#InfoString -> 'An application written in Pharo'.
			#BundleIdentifier -> 'org.pharo.packager'.
			#ShortVersion -> '1.0.0'.
			#DisplayName -> 'Projet'.
			#CommandLineHandler -> 'packager'.
"			#IconFile -> self iconFile."
		} asDictionary;
		outputDirectory: FileLocator workingDirectory / 'build';
		generate
]

{ #category : 'generation' }
PackagerProject class >> generateOSXPackageWithExternalResources [

	<script>

	AppGeneratorOSXGenerator new
		properties: {
			#AppName -> 'Demo'.
			#InfoString -> 'An application written in Pharo'.
			#BundleIdentifier -> 'org.pharo.packager'.
			#ShortVersion -> '1.0.0'.
			#DisplayName -> 'Projet'.
			#CommandLineHandler -> 'packager'.
"			#IconFile -> self iconFile."
			#CompanyName -> 'Pharo Consortium'
		} asDictionary;
		outputDirectory: FileLocator workingDirectory / 'build';
		addExternalFile: AppGeneratorOSXGenerator repositoryLocation / 'exampleResources' / 'singleResourceFile.txt';
		addExternalFile: AppGeneratorOSXGenerator repositoryLocation / 'exampleResources' / 'singleResourceFile.txt' destination: 'insideADirectory/singleResourceFile.txt';
		addExternalDirectory: AppGeneratorOSXGenerator repositoryLocation / 'myResourceDirectory';		
		generate
]

{ #category : 'generation' }
PackagerProject class >> generateWindowsPackage [

	<script>

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
		generate
]

{ #category : 'generation' }
PackagerProject class >> generateWindowsPackageWithExternalResources [

	<script>

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
		addExternalFile: AppGeneratorOSXGenerator repositoryLocation / 'exampleResources' / 'singleResourceFile.txt';
		addExternalFile: AppGeneratorOSXGenerator repositoryLocation / 'exampleResources' / 'singleResourceFile.txt' destination: 'insideADirectory/singleResourceFile.txt';
		addExternalDirectory: AppGeneratorOSXGenerator repositoryLocation / 'myResourceDirectory';		
		generate
]

{ #category : 'resources' }
PackagerProject class >> iconFile [
		
	^ AppGeneratorAbstractGenerator repositoryLocation / 'exampleResources' / 'ballon.ico'
]
