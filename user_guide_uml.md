---
layout: default
---
  
# Analyzing Sparx System EA UML models

This analyzer reads Sparx System Enterprise Architect UML models to determine dependencies between model packages and elements.
The element hierarchy bases on UML package and structure in the model.

## Pre requisites
Sparx Systems Enterprise Architect installed

## Settings

The following settings are defined:

| Setting           | Description                                                   | 
| ------------------|:--------------------------------------------------------------|
| LoggingEnabled    | Log information to file for diagnostic purposes               |
| InputFilename     | Filename of the EA model                                      |
| OutputFilename    | Filename with dsi extension to which results will be written  |

## Performing analysis

Use the following command:

DsmSuite.Analyzer.Uml.exe D:\DsmAnalysis\Uml\AnalyzerSettings.xml

If the setting file does not exist a default one will be created.

## AnalyzerSettings.xml example 

Example for analyzing the [DSMViewer UML model](https://github.com/dsmsuite/dsmsuite.github.io\uml_model\DsmViewer.eap).

```xml
<?xml version="1.0" encoding="utf-8"?>
<AnalyzerSettings xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" 
                  xmlns:xsd="http://www.w3.org/2001/XMLSchema">
  <LoggingEnabled>false</LoggingEnabled>
  <InputFilename>d:\Github\DsmSuite\DsmViewer\DsmViewer.eap</InputFilename>
  <OutputFilename>Output.dsi</OutputFilename>
</AnalyzerSettings>
```
## Logging

When logging is enabled the following types of logging are provided of the analysis:

| Log file                        | Description                                                                          | 
|:--------------------------------|:-------------------------------------------------------------------------------------|
| userMessages.log                | All messages as shown in the console                                                 |
| info.log                        | Information messages                                                                 |
| warnings.log                    | Warnings messages                                                                    |
| errors.log                      | Error messages                                                                       |
| exceptions.log                  | Lists exceptions during the analysis                                                 |
| dataModelActions.log            | Actions on the data model like load, save and registration of an element or relation |
| dataModelElementsNotFound.log   | Actions on the data model to find a specific element                                 |
| dataModelRelationsSkipped.log   | Actions on the data model to indicate that a relation can not be resolved            |                          |

The user messages log shows what percentage of the relations could be resolved. This is an indication of the
reliability of the dependency model.

[back](user_guide)
