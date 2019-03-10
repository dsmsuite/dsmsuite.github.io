---
layout: default
---

# Analyzing .Net code

## Purpose

The .Net analyzer is intended to analyse dependencies between .Net types. It parses the selected assemblies using 
Mono.Cecil to determine dependencies between .Net types. The element hierarchy is based on types and namespaces.


## Pre requisites
* None

## Performing an analysis

* Place the assemblies to be analyzed in a single directory.
* Create an analyzer settings file. This can be done by: 
    * Using the example below or 
	* Running the analyzer with a not existing file. This file will be created using default settings.
* Edit the analyzer settings file if required:
    * Update the AssemblyDirectory setting to point to the directory where the assemblies to be anayzed have been located.
	* Update the OutputFilename to the name of the product to which the assemblies belong.
	* Set LoggingEnabled if required.
* Run the analyzer from the command line with the analyzer settings filename as argument.
* The analyzer will:
    * Load each assembly found in the AssemblyDirectory.
    * Look for types in the assembly and register them.
    * Look for dependencies between types and register them. It will look at:
	    * Type members, properties, methods and events. 
		* Method return types, parameter types and variable types are taken into account. 
		* Also generic types and their parameters are taken into account.	
	* The found elements and dependencies are written to the OutputFilename.
	* At the end of the analysis the percentage of the relations could be resolved is shown. This is an indication of the reliability of the dependency model.
* If the percentage lower than 100% look at the 'dataModelRelationsNotResolved' log files to find out the reason.
    * If it is a missing product assembly, add it to the AssemblyDirectory	
	* If it is a missing thrd party assembly, add it to the AssemblyDirectory or ignore these relation by adding the namespace of the assembly to the list of ExternalNames.
* Optionally perform transformations on the OutputFilename. See section on Transformer for details.
* Convert the OutputFilename into a DSM file. See section on Builder for details.
* Open the DSM file in the Viewer.

## Settings

The following analyzer settings are defined:

| Setting           | Description                                                                    | 
|:------------------|:-------------------------------------------------------------------------------|
| LoggingEnabled    | Log information to file for diagnostic purposes.                               |
| AssemblyDirectory | Directory where assemblies to be analyzed have been located.                   |
| ExternalNames     | Namespace which start with these names will be ignored when finding relations. |
| OutputFilename    | Filename with dsi extension to which results will be written.                  |

## Command line

Use the following command:

DsmSuite.Analyzer.DotNet.exe AnalyzerSettings.xml

If the setting file does not exist a default one will be created.

## AnalyzerSettings.xml example 

Example for analyzing the installed DSM viewer.

```xml
<?xml version="1.0" encoding="utf-8"?>
<AnalyzerSettings xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema">
  <LoggingEnabled>true</LoggingEnabled>
  <AssemblyDirectory>D:\DsmAnalysis\DotNet\MyProduct\Binaries</AssemblyDirectory>
  <ExternalNames>
    <string>System.</string>
    <string>Microsoft.</string>
    <string>Interop/</string>
  </ExternalNames>
  <OutputFilename>MyProduct.dsi</OutputFilename>
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
| dataModelRelationsNotResolved | Contains queried relations that could not be resolved.                               |

The user messages log shows what percentage of the relations could be resolved. This is an indication of the
reliability of the dependency model.

[back](user_guide)
