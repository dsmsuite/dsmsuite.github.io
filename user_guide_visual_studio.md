---
layout: default
---
  
# Analyzing VC++ projects

## Purpose

The Visual studio analyzer is intended to determine dependencies between C/C++ source files based on header file includes. 
Also IDL files are taken into account.

The element hierarchy used to visualize the DSM can be based on:
* **PhysicalView**: The element hierarchy is based on directories. 
* **LogicalView**: The element hierarchy is based on solution folders and project filters. 
Namespaces are not taken into account.

> This analyzer provides more accurate results than the C++ analyzer, because include path per visual studio 
> project are taken into account. Therefor if you analyzer VC++ chose this analyzer and not the C++ analyzer.

## Pre requisites
* Visual Studio 2012 or higher.

## Performing an analysis

* Place the assemblies to be analyzed in a single directory.
* Create an analyzer settings file. This can be done by: 
    * Using the example below or 
	* Running the analyzer with a not existing settings file. A settings file using default settings will be created.
* Edit the analyzer settings file if required:
    * Update the AssemblyDirectory setting to point to the directory where the assemblies to be anayzed have been located.
	* Update the OutputFilename to the name of the product.
	* Set LoggingEnabled if required.
* Run the analyzer from the command line with the analyzer settings filename as argument.
* The analyzer will:
    * Load each assembly found in the AssemblyDirectory.
    * Look for types in the loaded assemblies and register them.
    * Look for dependencies between types and register them. It will look at:
	    * Type members, properties, methods and events. 
		* Method return types, parameters and variables. 
		* Generic types and their parameters.	
	* The found elements and dependencies are written to the OutputFilename.
	* At the end of the analysis the percentage of the relations that could be resolved is shown. This is an indication of the reliability of the dependency model.
* If the percentage lower than 100% look at the log files to find out the reason.
    * If it is a missing product assembly, add it to the AssemblyDirectory	
	* If it is a missing third party or system assembly, add it to the AssemblyDirectory or ignore these relations by adding its namespace to the list of ExternalNames.
* Optionally perform transformations on the the OutputFilename. See [User guide](user_guide) for details.
* Convert the OutputFilename into a DSM file. See [User guide](user_guide) for details.
* Open the DSM file in the Viewer.

## Command line usage

Use the following command to run a analysis:

```
"C:\Program Files (x86)\DsmSuite\Analyzers\DotNet\DsmSuite.Analyzer.DotNet.exe" AnalyzerSettings.xml
```

## Settings

The following settings are defined:

| Setting                     | Description                                                                          | 
|:----------------------------|:-------------------------------------------------------------------------------------|
| LoggingEnabled              | Log information to file for diagnostic purposes                                      |
| SolutionGroups              | Full path to visual studio solution files organized in groups                        |
| AnalyzeMode                 | Analyze source file or project dependencies                                          |
| ViewMode                    | Based the element hierarchy on directorie or solution folders and project filters    | 
| SystemIncludeDirectories    | List of directories where system include files can be found.                         |
| InterfaceIncludeDirectories | List of directories where interface include files can be found. These can be clones. |
| ExternalIncludeDirectories  | List of directories where third party include files can be found.                    |
| OutputFilename              | Filename with dsi extension to which results will be written                         |   

## Performing analysis

Use the following command:

DsmSuite.Analyzer.VisualStudio.exe AnalyzerSettings.xml

If the setting file does not exist a default one will be created.

## AnalyzerSettings.xml example 

Example for analyzing C++ in a D:\MyProject\MyProject.sln directory.

```xml
<?xml version="1.0" encoding="utf-8"?>
<AnalyzerSettings xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema">
  <LoggingEnabled>true</LoggingEnabled>
  <SolutionGroups>
    <SolutionGroup>
      <Name>Name1</Name>
      <SolutionFilenames>
        <string>D:\MyProjects\Solution1.sln</string>
        <string>D:\MyProjects\Solution2.sln</string>
      </SolutionFilenames>
    </SolutionGroup>
    <SolutionGroup>
      <Name>Name2</Name>
      <SolutionFilenames>
        <string>D:\MyProjects\Solution3.sln</string>
      </SolutionFilenames>
    </SolutionGroup>
  </SolutionGroups>
  <RootDirectory>D:\MyProjects</RootDirectory>
  <SystemIncludeDirectories>
    <string>C:\Program Files (x86)\Windows Kits\8.1\Include\um</string>
    <string>C:\Program Files (x86)\Windows Kits\8.1\Include\shared</string>
    <string>C:\Program Files (x86)\Windows Kits\10\Include\10.0.10240.0\ucrt</string>
    <string>C:\Program Files (x86)\Microsoft Visual Studio 14.0\VC\include</string>
    <string>C:\Program Files (x86)\Microsoft Visual Studio 14.0\VC\atlmfc\include</string>
  </SystemIncludeDirectories>
  <InterfaceIncludeDirectories>
    <string>D:\MyInterfacesIncludes</string>
  </InterfaceIncludeDirectories>
  <ExternalIncludeDirectories>
    <string>D:\MyThirdPartyIncludes</string>  
  </ExternalIncludeDirectories>
  <ViewMode>LogicalView</ViewMode>
  <OutputFilename>MyProject.dsi</OutputFilename>
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
| filesNotFound.log               | Source files not found in the file system                                            |
| includePathsNotFound.log        | Include paths not found in the file system                                           |
| pathsNotResolved.log            | Relative include files which could not be resolved to an absolute path               |
| includeFilesNotFound.log        | Absolute include files which could not be found in the file system                   |
| dataModelActions.log            | Actions on the data model like load, save and registration of an element or relation |
| dataModelRelationsNotResolved.log | Actions on the data model to indicate that a relation could not be resolved          |                              |

The user messages log shows what percentage of the relations could be resolved. This is an indication of the
reliability of the dependency model.

[back](user_guide)
