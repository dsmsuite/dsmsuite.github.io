---
layout: default
---

# Analyzing Java code

This Java analyzer reads a Jdeps .dot file to determine dependencies between Java classes.
The element hierarchy is based on namespaces.

## Pre requisites
* Java SDK 8 or higher which contains Jdeps must be installed .

## Settings

The following settings are defined:

| Setting           | Description                                                        | 
|:------------------|:-------------------------------------------------------------------|
| LoggingEnabled    | Log information to file for diagnostic purposes                    |
| InputFilename     | Filename of Jdeps .dot file used to extract dependency information |
| OutputFilename    | Filename with dsi extension to which results will be written       |     

## Performing analysis

Use the following command (Example for analyzing [ArgoUML](http://argouml.tigris.org/) binaries):

jdeps -verbose:class -recursive -dotoutput D:\ArgoUmlAnalysisResults d:\ArgoUml\argouml.jar 
DsmSuite.Analyzer.Jdeps.exe AnalyzerSettings.xml

If the setting file does not exist a default one will be created.

## AnalyzerSettings.xml example 

```xml
<?xml version="1.0" encoding="utf-8"?>
<AnalyzerSettings xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema">
  <LoggingEnabled>false</LoggingEnabled>
  <InputFilename>D:\ArgoUmlAnalysisResults\argouml.jar.dot</InputFilename>
  <OutputFilename>Output.dsi</OutputFilename>
</AnalyzerSettings>
```

[back](user_guide)
