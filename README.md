# PrismCodeDisplayer for Seaside

This project is an implementation of Prism.js in Seaside with a model associated.

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

## Material Design Lite integration

An integration package with [Material Design Lite](https://github.com/DuneSt/MaterialDesignLite) is available by loading the `mdl` group from Prism's baseline. 

## Examples

You can find multiple examples when the application will be installed at the url: [http://localhost:8080/PrismDemo](http://localhost:8080/PrismDemo)

When you install in a plain Pharo image you need to start the seaside server first by opening `World menu > Tools > Seaside Control Panel` and adding and starting an appropropriate `ZnZincServerAdaptor`. If you do not use port 8080, change the port in the URL.

You can find a demo at: [https://demos.ferlicot.fr/PrismDemo](https://demos.ferlicot.fr/PrismDemo)

## Latest supported Dependency

- [Prism v1.17.1](https://github.com/PrismJS/prism/releases/tag/v1.17.1)

## Smalltalk versions compatibility

| Prism version 	| Compatible Pharo versions 	|
|---------------	|---------------------------	|
| v1.x.x	      	| Pharo 61, 70, 80, 90, 10         	|
| development      	| Pharo 61, 70, 80, 90, 10         	|

## Contact

If you have any question or problem do not hesitate to open an issue or contact cyril (a) ferlicot.me or guillaume.larcheveque (a) gmail.com
