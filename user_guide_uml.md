---
layout: default
---
  
# Analyzing Sparx System EA UML models

## Purpose

The UML analyzer is intended to analyse dependencies between UML elements of a Sparx System Enterprise Architect UML model.
The element hierarchy bases on UML package and structure in the model.

## Pre requisites
Sparx Systems Enterprise Architect installed

## Performing an analysis

* Create an analyzer settings file. This can be done by: 
    * Using the example below or 
	* Running the analyzer with a not existing settings file. A settings file using default settings will be created.
* Edit the analyzer settings file if required:
    * Update the Input.Filename setting to point to the UML model file.
	* Update the Output.Filename to the name of the product.
	* Change the log level if required.
* Run the analyzer from the command line with the analyzer settings filename as argument.
* The analyzer will:
    * Read Sparx System Enterprise Architect UML models to determine dependencies between model packages and elements.
	* The found elements and dependencies are written to the Output.Filename.
	* At the end of the analysis the percentage of the relations that could be resolved is shown. This is an indication of the reliability of the dependency model.
* Import the DSI file in the DSM viewer.

## Command line usage

Use the following command to run a analysis:

```
"C:\Program Files\DsmSuite\Analyzers\UML\DsmSuite.Analyzer.Uml.exe" AnalyzerSettings.xml


## Settings

The following settings are defined:

| Setting                                    | Description                                                                | 
|:-------------------------------------------|:---------------------------------------------------------------------------|
| LogLevel                                   | Log level as described above                                               |
| Input.Filename                             | EA model filename                                                          |     
| Output.Filename                            | Filename with dsi extension to which results will be written               |
| Output.Compress                            | Compress output file                                                       |

## AnalyzerSettings.xml example 

Example for analyzing the [DSMViewer UML model](https://github.com/dsmsuite/dsmsuite.github.io\uml_model\DsmViewer.eap).

```xml
<?xml version="1.0" encoding="utf-8"?>
<AnalyzerSettings xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
  <LogLevel>Error</LogLevel>
  <Input>
    <Filename>SampleModel.EAP</Filename>
  </Input>
  <Output>
    <Filename>SampleModel.dsi</Filename>
    <Compress>true</Compress>
  </Output>
</AnalyzerSettings>
```

## Additional Logging

No additional logging files defined.

[back](user_guide)
