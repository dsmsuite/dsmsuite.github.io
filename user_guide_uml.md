---
layout: default
---
  
# Analyzing Sparx System EA UML models

This analyzer read Sparx System Enterprise Architect UML models. 
The element hierarchy bases on UML package structure in the model.

## Pre requisites
Sparx Systems Enterprise Architect installed

## Settings

The following settings are defined:

| Setting           | Description                                                   | 
| ------------------|:--------------------------------------------------------------|
| LoggingEnabled    | Log information to file for diagnostic purposes               |
| ModelFilename     | Filename of the EA model                                      |
| OutputFilename    | Filename with dsi extension to which results will be written  |

## Example

## Example

Example for analyzing the [DSMViewer UML model](https://github.com/dsmsuite/dsmsuite.github.io\uml_model\DsmViewer.eap).

**AnalyzerSettings.xml**

```xml
<?xml version="1.0" encoding="utf-8"?>
<AnalyzerSettings xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema">
  <LoggingEnabled>false</LoggingEnabled>
  <ModelFilename>D:\DsmAnalysis\UML\DsmViewer.eap</ModelFilename>
  <OutputFilename>D:\DsmAnalysis\UML\uml.dsi</OutputFilename>
</AnalyzerSettings>
```

**BuilderSettings.xml***

```xml
<?xml version="1.0" encoding="utf-8"?>
<BuilderSettings xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema">
  <LoggingEnabled>false</LoggingEnabled>
  <InputFilename>D:\DsmAnalysis\UML\uml.dsi</InputFilename>
  <OutputFilename>D:\DsmAnalysis\UML\uml.dsm</OutputFilename>
</BuilderSettings>
```

**Analyze.bat**

```
"C:\Program Files (x86)\DsmSuite\UmlAnalyzer\DsmSuite.Analyzer.Uml.exe" D:\DsmAnalysis\Uml\AnalyzerSettings.xml
"C:\Program Files (x86)\DsmSuite\DsmViewer\DsmSuite.DsmBuilder.exe" D:\DsmAnalysis\Uml\BuilderSettings.xml
```

[back](user_guide)