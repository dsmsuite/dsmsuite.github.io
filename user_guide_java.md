---
layout: default
---

# Analyzing Java code

## Purpose

The Java analyzer is intended to analyse dependencies between Java types. It use a JDeps output file as input.
The element hierarchy is based on types and namespaces.

## Pre requisites
* Java SDK 8 or higher, which contains Jdeps must be installed .

## Performing an analysis

* Place the JAR files to be analyzed in a single directory.
* Run a JDeps analysis.
* Create an analyzer settings file. This can be done by: 
    * Using the example below or 
	* Running the analyzer with a not existing settings file. A settings file using default settings will be created.
* Edit the analyzer settings file if required:
    * Update the InputFilename setting to point to the JDeps outout file.
	* Update the OutputFilename to the name of the product.
	* Set LoggingEnabled if required.
* Run the analyzer from the command line with the analyzer settings filename as argument.
* The analyzer will:
    * Parse the JDeps output file to determine types and their dependencies.
	* The found elements and dependencies are written to the OutputFilename.
	* At the end of the analysis the percentage of the relations that could be resolved is shown. This is an indication of the reliability of the dependency model.
* Optionally perform transformations on the the OutputFilename. See [User guide](user_guide) for details.
* Convert the OutputFilename into a DSM file. See [User guide](user_guide) for details.
* Open the DSM file in the Viewer.

## Command line usage 

Use the following command to run JDeps (ArgoUML analysis example):

```
"C:\Program Files\Java\jdk1.8.0_161\bin\jdeps" -verbose:class -recursive -dotoutput D:\DsmAnalysis\Java\ArgoUml\JdepsOutput D:\DsmAnalysis\Java\ArgoUml\Binaries\argouml.jar 
```

Use the following command to run a analysis using the JDeps output file:

```
"C:\Program Files (x86)\DsmSuite\Analyzers\Java\DsmSuite.Analyzer.Jdeps.exe" AnalyzerSettings.xml
```

## Settings

The following settings are defined:

| Setting           | Description                                                        | 
|:------------------|:-------------------------------------------------------------------|
| LoggingEnabled    | Log information for diagnostic purposes                            |
| InputFilename     | Filename of Jdeps .dot file used to extract dependency information |
| OutputFilename    | Filename with dsi extension to which results will be written       |     

## AnalyzerSettings.xml example 

An example settings file is shown below  (ArgoUML analysis example):

```xml
<?xml version="1.0" encoding="utf-8"?>
<AnalyzerSettings xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" 
                  xmlns:xsd="http://www.w3.org/2001/XMLSchema">
  <LoggingEnabled>false</LoggingEnabled>
  <InputFilename>D:\ArgoUmlAnalysisResults\argouml.jar.dot</InputFilename>
  <OutputFilename>Output.dsi</OutputFilename>
</AnalyzerSettings>
```
## Logging

When logging is enabled the following types of logging are provided of the analysis:

| Log file                      | Description                                                                          | 
|:------------------------------|:-------------------------------------------------------------------------------------|
| userMessages                  | Contains all messages as shown in the console.                                       |
| info                          | Contains information messages.                                                       |
| warnings                      | Contains warnings messages.                                                          |
| errors                        | Contains error messages.                                                             |
| exceptions                    | Contains the exceptions that occured during the analysis.                            |
| dataModelActions              | Contains all actions on the data model like load, save and registration.             |
| dataModelRelationsNotResolved | Contains queried relations that could not be resolved.                               |                           |

[back](user_guide)
