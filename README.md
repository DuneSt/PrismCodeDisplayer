# PrismCodeDisplayer for Seaside

#### Linux/OSX builds

Master:[![Build Status](https://travis-ci.org/DuneSt/PrismCodeDisplayer.svg?branch=master)](https://travis-ci.org/DuneSt/PrismCodeDisplayer) | Development: [![Build Status](https://travis-ci.org/DuneSt/PrismCodeDisplayer.svg?branch=development)](https://travis-ci.org/DuneSt/PrismCodeDisplayer)

#### Windows builds

Master: [![Build status](https://ci.appveyor.com/api/projects/status/hobn9e8elv13g0if/branch/master?svg=true)](https://ci.appveyor.com/project/jecisc/prismcodedisplayer/branch/master) | Last Commit: [![Build status](https://ci.appveyor.com/api/projects/status/hobn9e8elv13g0if?svg=true)](https://ci.appveyor.com/project/jecisc/prismcodedisplayer)

This project is an implementation of Prism.js in Seaside with a model associated to charts.

# Documentation

## Version management 

This project use semantic versionning to define the releases. This mean that each stable release of the project will get associate a version number of the form `vX.Y.Z`. 

- **X** define the major version number
- **Y** define the minor version number 
- **Z** define the patch version number

When a release contains only bug fixes, the patch number increase. When the release contains new features backward compatibles, the minor version increase. When the release contains breaking changes, the major version increase. 

Thus, it should be safe to depend on a fixed major version and moving minor version of this project.

## Install Prism Seaside

To install Prism on your Pharo image you can execute:

```Smalltalk
    Metacello new
        githubUser: 'DuneSt' project: 'PrismCodeDisplayer' commitish: 'master' path: 'src';
        baseline: 'PrismCodeDisplayer';
        onUpgrade: [ :e | e useIncoming ];
        onWarningLog;
        load
```

To add Prism Seaside to your baseline just add this:

```Smalltalk
    spec
        baseline: 'PrismCodeDisplayer'
        with: [ spec repository: 'github://DuneSt/PrismCodeDisplayer:v1.x.x/src' ]
```

Note that you can replace the #v1.x.x by a branch name as #master, #development or a tag as #v1.0.0, #v1.? or #v1.2.x or a commit SHA.

## Getting started

### Add the right libraries

To use Prism for Seaside you will need to add JQuery and Prism libraries to your application:

```Smalltalk
	(WAAdmin register: self asApplicationAt: 'myApplication')
		addLibrary: PrismLibrary;
		addLibrary: JQDeploymentLibrary
```

## Examples

You can find multiple examples when the application will be installed at the url: [http://localhost:8080/PrismDemo](http://localhost:8080/PrismDemo)

When you install in a plain Pharo image you need to start the seaside server first by opening `World menu > Tools > Seaside Control Panel` and adding and starting an appropropriate `ZnZincServerAdaptor`. If you do not use port 8080, change the port in the URL.

You can find a demo at: [https://demos.ferlicot.fr/PrismDemo](https://demos.ferlicot.fr/PrismDemo)

## Latest supported Dependency

- [Prism v1.14.0](https://github.com/PrismJS/prism/releases/tag/v1.14.0)

## Smalltalk versions compatibility

| Prism version 	| Compatible Pharo versions 	|
|---------------	|---------------------------	|
| development      	| Pharo 61                  	|

## Contact

If you have any question or problem do not hesitate to open an issue or contact cyril (a) ferlicot.me or guillaume.larcheveque (a) gmail.com