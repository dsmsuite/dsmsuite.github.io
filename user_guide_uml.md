---
layout: default
---
  
# Analyzing Sparx System EA UML models

This analyzer reads Sparx System Enterprise Architect UML models. 
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

[back](user_guide)
