---
layout: default
---

# Analyzing .Net code

The .Net analyzer parses assemblies using Mono.Cecil to determine dependencies between .Net classes.
The element hierarchy is based on namespaces.

## Pre requisites
* None

## Settings

The following settings are defined:

| Setting           | Description                                                   | 
| ------------------|:--------------------------------------------------------------|
| LoggingEnabled    | Log information to file for diagnostic purposes               |
| AssemblyDirectory | Directory where assemblies to be analyzed can be found        |
| OutputFilename    | Filename with dsi extension to which results will be written  |

## Example

Example for analyzing the installed DSM viewer.

**AnalyzerSettings.xml**

```xml
<?xml version="1.0" encoding="utf-8"?>
<AnalyzerSettings xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" 
                  xmlns:xsd="http://www.w3.org/2001/XMLSchema">
  <LoggingEnabled>false</LoggingEnabled>
  <AssemblyDirectory>C:\Program Files (x86)\DsmSuite\DsmViewer</AssemblyDirectory>
  <OutputFilename>DsmViewer.dsi</OutputFilename>
</AnalyzerSettings>
```

**BuilderSettings.xml***

```xml
<?xml version="1.0" encoding="utf-8"?>
<BuilderSettings xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" 
                 xmlns:xsd="http://www.w3.org/2001/XMLSchema">
  <LoggingEnabled>false</LoggingEnabled>
  <InputFilename>DsmViewer.dsi</InputFilename>
  <OutputFilename>DsmViewer.dsm</OutputFilename>
</BuilderSettings>
```

**Analyze.bat**

```
DsmSuite.Analyzer.DotNet.exe AnalyzerSettings.xml
DsmSuite.DsmBuilder.exe BuilderSettings.xml
```

[back](user_guide)