---
layout: default
---

# Analyzing Java code

## Purpose

The Java analyzer is intended to analyse dependencies between Java types. It use a Jdeps output file as input.
The element hierarchy is based on types and namespaces.

## Pre requisites
* Java SDK 8 or higher, which contains Jdeps must be installed .

## Performing an analysis

* Place the JAR files to be analyzed in a single directory.
* Run a Jdeps analysis.
* Create an analyzer settings file. This can be done by: 
    * Using the example below or 
	* Running the analyzer with a not existing settings file. A settings file using default settings will be created.
* Edit the analyzer settings file if required:
    * Update the InputFilename setting to point to the Jdeps output file.
	* Update the OutputFilename to the name of the product.
	* Set LoggingEnabled if required.
* Run the analyzer from the command line with the analyzer settings filename as argument. The analyzer will:
    * Parse the JDeps output file to determine types and their dependencies.
	* The found types and dependencies are written to the OutputFilename.
* At the end of the analysis the percentage of the relations that could be resolved is shown. This is an indication of the reliability of the dependency model.
* Convert the OutputFilename into a DSM file. See [User guide](user_guide) for details.
* Open the DSM file in the Viewer.

## Command line usage 

Use the following command to run JDeps (ArgoUML analysis example):

```
"C:\Program Files\Java\jdk1.8.0_161\bin\jdeps" -verbose:class -recursive -dotoutput D:\DsmAnalysis\Java\ArgoUml\JdepsOutput D:\DsmAnalysis\Java\ArgoUml\Binaries\argouml.jar 
```

Use the following command to run a analysis using the JDeps output file:

```
"C:\Program Files\DsmSuite\Analyzers\Java\DsmSuite.Analyzer.Jdeps.exe" AnalyzerSettings.xml
```

Note: You can also analyze Android projects by converting the APK file into JAR files using DEX2JAR.

## Settings

The following settings are defined:

| Setting                                    | Description                                                                | 
|:-------------------------------------------|:---------------------------------------------------------------------------|
| LogLevel                                   | Log level as described above                                               |
| Input.Filename                             | Filename of Jdeps .dot file used to extract dependency information         | 
| Transformation.IgnoredNames                | Names in input data which will be ignore. Defines as regular expression.   |     
| Output.Filename                            | Filename with dsi extension to which results will be written               |
| Output.Compress                            | Compress output file                                                       |

## AnalyzerSettings.xml example 

An example settings file is shown below  (ArgoUML analysis example):

```xml
<?xml version="1.0" encoding="utf-8"?>
<AnalyzerSettings xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
  <LogLevel>Error</LogLevel>
  <Input>
    <Filename>ArgoUml\JdepsOutput\argouml.jar.dot</Filename>
  </Input>
  <Transformation>
    <IgnoredNames />
  </Transformation>
  <Output>
    <Filename>argouml.dsi</Filename>
    <Compress>true</Compress>
  </Output>
</AnalyzerSettings>
```

## Additional Logging

No additional logging files defined.

[back](user_guide)
