---
layout: default
---

# Analyzing .Net code

The .Net analyzer parses assemblies using Mono.Cecil to determine dependencies between .Net types.
The element hierarchy is based on namespaces.

## Pre requisites
* None

## Settings

The following settings are defined:

| Setting           | Description                                                   | 
|:------------------|:--------------------------------------------------------------|
| LoggingEnabled    | Log information to file for diagnostic purposes               |
| AssemblyDirectory | Directory where assemblies to be analyzed can be found        |
| ExternalNames     | Types full namespace which start with these names are ignored |
| OutputFilename    | Filename with dsi extension to which results will be written  |

## Performing analysis

Use the following command:

DsmSuite.Analyzer.DotNet.exe AnalyzerSettings.xml

If the setting file does not exist a default one will be created.

## AnalyzerSettings.xml example 

Example for analyzing the installed DSM viewer.

```xml
<?xml version="1.0" encoding="utf-8"?>
<AnalyzerSettings xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema">
  <LoggingEnabled>true</LoggingEnabled>
  <AssemblyDirectory>D:\DsmAnalysis\DotNet\DsmSuite\Binaries</AssemblyDirectory>
  <ExternalNames>
    <string>System.</string>
    <string>Microsoft.</string>
    <string>Interop/</string>
  </ExternalNames>
  <OutputFilename>DsmSuite.dsi</OutputFilename>
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
| dataModelRelationsNotResolved.log | Actions on the data model to indicate that a relation could not be resolved          |                              |
| dataModelRelationsSkipped.log     | Actions on the data model to indicate that a relation has been skipped               |                         |

The user messages log shows what percentage of the relations could be resolved. This is an indication of the
reliability of the dependency model.

[back](user_guide)
