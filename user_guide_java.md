---
layout: default
---

# Analyzing Java code

## Purpose

The Java analyzer is intended to analyse dependencies between Java types. It use a JDeps output file as input.
The element hierarchy is based on types and namespaces.

## Pre requisites
* Java SDK 8 or higher, which contains Jdeps must be installed .

## Performing analysis

Use the following command (Example for analyzing [ArgoUML](http://argouml.tigris.org/) binaries) to analyze the dependencies between Java types using Jdeps:

```
jdeps -verbose:class -recursive -dotoutput D:\ArgoUmlAnalysisResults d:\ArgoUml\argouml.jar 
```

Then use the 
DsmSuite.Analyzer.Jdeps.exe AnalyzerSettings.xml

```
If the setting file does not exist a default one will be created.
```
## Settings

The following settings are defined:

| Setting           | Description                                                        | 
|:------------------|:-------------------------------------------------------------------|
| LoggingEnabled    | Log information to file for diagnostic purposes                    |
| InputFilename     | Filename of Jdeps .dot file used to extract dependency information |
| OutputFilename    | Filename with dsi extension to which results will be written       |     

## AnalyzerSettings.xml example 

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
| exceptions                    | Contains information about any exceptions that occured during the analysis.          |
| dataModelActions              | Contains all actions on the data model like load, save and registration.             |
| dataModelRelationsNotResolved | Contains queried relations that could not be resolved.                               |                            |

[back](user_guide)
