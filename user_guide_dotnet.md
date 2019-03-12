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
	* Running the analyzer with a not existing settings file. A settings file using default settings will be created.
* Edit the analyzer settings file if required:
    * Update the AssemblyDirectory setting to point to the directory where the assemblies to be analyzed are located.
	* Update the OutputFilename to the name of the product.
	* Set LoggingEnabled if required.
* Run the analyzer from the command line with the analyzer settings filename as argument. The analyzer will:
    * Load each assembly found in the AssemblyDirectory.
    * Look for types in the loaded assemblies and register them.
    * Look for type dependencies in the loaded assemblies and register them. It will look at:
	    * Type members, properties, methods and events. 
		* Method return types, parameters and variables. 
		* Generic types and their parameters.	
	* The found types and dependencies are written to the OutputFilename.
* At the end of the analysis the percentage of the relations that could be resolved is shown. This is an indication of the reliability of the dependency model. If the percentage lower than 100% look at the log files to find out the reason.
    * If it is a missing product assembly, add it to the AssemblyDirectory	
	* If it is a missing third party or system assembly, add it to the AssemblyDirectory or ignore these relations by adding its namespace to the list of ExternalNames.
* Optionally perform transformations on the the OutputFilename. See [User guide](user_guide) for details.
* Convert the OutputFilename into a DSM file. See [User guide](user_guide) for details.
* Open the DSM file in the DSM viewer.

## Command line usage

Use the following command to run a analysis:

```
"C:\Program Files (x86)\DsmSuite\Analyzers\DotNet\DsmSuite.Analyzer.DotNet.exe" AnalyzerSettings.xml
```

## Settings

The following analyzer settings are defined:

| Setting           | Description                                                                        | 
|:------------------|:-----------------------------------------------------------------------------------|
| LoggingEnabled    | Log information for diagnostic purposes.                                           |
| AssemblyDirectory | Directory where assemblies to be analyzed are located.                             |
| ExternalNames     | Namespaces starting with these names will be ignored when looking for dependencies.|
| OutputFilename    | Filename with dsi extension to which results will be written.                      |

## Settings example 

An example settings file is shown below (DSM Suite analysis example):

```xml
<?xml version="1.0" encoding="utf-8"?>
<AnalyzerSettings xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" 
                  xmlns:xsd="http://www.w3.org/2001/XMLSchema">
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

| Log file                      | Description                                                                          | 
|:------------------------------|:-------------------------------------------------------------------------------------|
| userMessages                  | Contains all messages as shown in the console.                                       |
| info                          | Contains information messages.                                                       |
| warnings                      | Contains warnings messages.                                                          |
| errors                        | Contains error messages.                                                             |
| exceptions                    | Contains the exceptions that occured during the analysis.                            |
| dataModelActions              | Contains all actions on the data model like load, save and registration.             |
| dataModelRelationsNotResolved | Contains queried relations that could not be resolved.                               |

[back](user_guide)
