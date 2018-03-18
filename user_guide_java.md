---
layout: default
---

# Analyzing Java code

This Java analyzer reads a Jdeps .dot file to determine dependencies between Java classes.
The element hierarchy is based on namespaces.

> Run jdeps as shown in the example below:
> jdeps" -verbose:class -recursive -dotoutput D:\DsmAnalysis\Java d:\ArgoUml\argouml.jar 

## Pre requisites
* Java SDK 8 or higher which contains Jdeps must be installed .

## Settings

The following settings are defined:

| Setting           | Description                                                        | 
| ------------------|:-------------------------------------------------------------------|
| LoggingEnabled    | Log information to file for diagnostic purposes                    |
| JdepsDotInputFile | Filename of Jdeps .dot file used to extract dependency information |
| OutputFilename    | Filename with dsi extension to which results will be written       |     

## Example

Example for analyzing [ArgoUML](http://argouml.tigris.org/) binaries.

**AnalyzerSettings.xml**

```xml
<?xml version="1.0" encoding="utf-8"?>
<AnalyzerSettings xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema">
  <LoggingEnabled>false</LoggingEnabled>
  <JdepsDotInputFile>D:\DsmAnalysis\Java\argouml.jar.dot</JdepsDotInputFile>
  <OutputFilename>D:\DsmAnalysis\Java\argouml.dsi</OutputFilename>
</AnalyzerSettings>
```

**BuilderSettings.xml***

```xml
<?xml version="1.0" encoding="utf-8"?>
<BuilderSettings xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema">
  <InputFilename>D:\DsmAnalysis\Java\argouml.dsi</InputFilename>
  <OutputFilename>D:\DsmAnalysis\Java\argouml.dsm</OutputFilename>
</BuilderSettings>
```

**Analyze.bat**

```
"C:\Program Files\Java\jdk1.8.0_45\bin\jdeps" -verbose:class -recursive -dotoutput D:\DsmAnalysis\Java d:\ArgoUml\argouml.jar 
"C:\Program Files (x86)\DsmSuite\JdepsAnalyzer\DsmSuite.Analyzer.Jdeps.exe" AnalyzerSettings.xml
"C:\Program Files (x86)\DsmSuite\DsmViewer\DsmSuite.DsmBuilder.exe" BuilderSettings.xml
```

[back](user_guide)