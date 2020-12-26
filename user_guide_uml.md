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
    * Update the InputFilename setting to point to the UML model file.
	* Update the OutputFilename to the name of the product.
	* Set LoggingEnabled if required.
* Run the analyzer from the command line with the analyzer settings filename as argument.
* The analyzer will:
    * Read Sparx System Enterprise Architect UML models to determine dependencies between model packages and elements.
	* The found elements and dependencies are written to the OutputFilename.
	* At the end of the analysis the percentage of the relations that could be resolved is shown. This is an indication of the reliability of the dependency model.
* Optionally perform transformations on the the OutputFilename. See [User guide](user_guide) for details.
* Convert the OutputFilename into a DSM file. See [User guide](user_guide) for details.
* Open the DSM file in the Viewer.

## Command line usage

Use the following command to run a analysis:

```
"C:\Program Files\DsmSuite\Analyzers\UML\DsmSuite.Analyzer.Uml.exe" AnalyzerSettings.xml


## Settings

The following settings are defined:

| Setting              | Description                                                   | 
| ---------------------|:--------------------------------------------------------------|
| LoggingEnabled       | Log information for diagnostic purposes                       |
| InputFilename        | Filename of the EA model                                      |
| OutputFilename       | Filename with dsi extension to which results will be written  |
| CompressOutputFile   | Compress output                                               |

## AnalyzerSettings.xml example 

Example for analyzing the [DSMViewer UML model](https://github.com/dsmsuite/dsmsuite.github.io\uml_model\DsmViewer.eap).

```xml
<?xml version="1.0" encoding="utf-8"?>
<AnalyzerSettings xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
  <LogLevel>Detailed</LogLevel>
  <Input>
    <Filename>SampleModel.EAP</Filename>
  </Input>
  <Output>
    <Filename>SampleModel.dsi</Filename>
    <Compress>true</Compress>
  </Output>
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
