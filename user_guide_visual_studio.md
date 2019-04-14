---
layout: default
---
  
# Analyzing VC++ projects

## Purpose

The Visual studio analyzer is intended to determine dependencies between C/C++ source files based on header file includes. 
Also IDL files and their generated files are taken into account.

> This analyzer used the Microsoft.Build.Evaluation API. For proper analysis it is required that solutions compile successfully.

The element hierarchy used to visualize the DSM can be based on:
* **PhysicalView**: The element hierarchy is based on directories. 
* **LogicalView**: The element hierarchy is based on solution folders and project filters. 
Namespaces and types are not taken into account.

> This analyzer provides more accurate results than the C++ analyzer, because include path per visual studio 
> project are taken into account. Therefor if you analyzer VC++ chose this analyzer and not the C++ analyzer.

## Pre requisites
* Visual Studio 2012 or higher.

## Performing an analysis

* Create an analyzer settings file. This can be done by: 
    * Using the example below or 
	* Running the analyzer with a not existing settings file. A settings file using default settings will be created.
* Edit the analyzer settings file if required:
    * Add one or more Visual Studio solutions to the settings file. If one or a few Visual Studio solutions are analyzed put them in an uinnamed group. If many solutions are added theey can be organized in groups.
    * Select if yo want to create and phsyical or logical view.
	* Add system include paths to SystemIncludeDirectories
	* Add third party include paths to ExternalIncludeDirectories. Add a name to whcih these direcrories should be resolved in the DSM.
	the AssemblyDirectory setting to point to the directory where the assemblies to be anayzed have been located.
	* Add interface include paths to InterfaceIncludeDirectories. These directories will be searched for interface files.
	* Update the OutputFilename to the name of the product.
	* Set LoggingEnabled if required.
* Run the analyzer from the command line with the analyzer settings filename as argument.
* The analyzer will:
    * Scan all Visual Studio solutions and projects for source files.
	* Parse all found source files for include dependencies. It will take into account include paths defined in property file. 
	* It will try to resolve the relative include filenames into absolute filenames. It will do this as follows:
	    * It will first check if the file can be found in the interfaces directories. It the file can be found here is a clone of a file in one of the solutions the absolute path of this will be be used.
		* It will then test if is is an external of system include fiel.
		* Finally it will check igf the include file in in one 
	* The found files and dependencies are written to the OutputFilename.
	* At the end of the analysis the percentage of the relations that could be resolved is shown. This is an indication of the reliability of the dependency model.
* If the percentage lower than 100% look at the log files to find out the reason.
    * If it is due to a missing system include path add it to SystemIncludeDirectories.
    * If it is due to a third party include path add it to ExternalIncludeDirectories and resolve it in the proper way.
	* If it is due to a interface include path add it to InterfaceIncludeDirectories.
	* If it is because the include file missing in the Visual Studio projects add its path to ExternalIncludeDirectories and resolve it in the proper way.
* Optionally perform transformations on the the OutputFilename. See [User guide](user_guide) for details.
* Convert the OutputFilename into a DSM file. See [User guide](user_guide) for details.
* Open the DSM file in the Viewer.

## Command line usage

Use the following command to run a analysis:

```
"C:\Program Files (x86)\DsmSuite\Analyzers\VisualStudio\DsmSuite.Analyzer.VisualStudio.exe" AnalyzerSettings.xml
```

## Settings

The following settings are defined:

| Setting                     | Description                                                                          | 
|:----------------------------|:-------------------------------------------------------------------------------------|
| LoggingEnabled              | Log information to file for diagnostic purposes                                      |
| SolutionGroups              | Full path to visual studio solution files organized in named or unnamed groups       |
| AnalyzeMode                 | Analyze source file or project dependencies                                          |
| ViewMode                    | Based the element hierarchy on directorie or solution folders and project filters    | 
| SystemIncludeDirectories    | List of directories where system include files can be found.                         |
| InterfaceIncludeDirectories | List of directories where interface include files can be found. These can be clones. |
| ExternalIncludeDirectories  | List of directories where third party include files can be found.                    |
| ToolsVersion                | Should matche installed version (14.0=VS2015 15.0=VS2017)                            |
| OutputFilename              | Filename with dsi extension to which results will be written                         |  
| CompressOutputFile          | Compress output                                                                      |

## AnalyzerSettings.xml example 

Example for analyzing C++ in a D:\MyProject\MyProject.sln directory.

```xml
<?xml version="1.0" encoding="utf-8"?>
<AnalyzerSettings xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" 
                  xmlns:xsd="http://www.w3.org/2001/XMLSchema">
  <LoggingEnabled>true</LoggingEnabled>
 <SolutionGroups>
    <SolutionGroup>
      <Name></Name>
      <SolutionFilenames>
        <string>D:\MyProduct\MyProduct.sln</string>
      </SolutionFilenames>
    </SolutionGroup>
  </SolutionGroups>
  <RootDirectory>D:\MyProduct</RootDirectory>
  <SystemIncludeDirectories>
    <string>C:\Program Files (x86)\Windows Kits\8.1\Include\um</string>
    <string>C:\Program Files (x86)\Windows Kits\8.1\Include\shared</string>
    <string>C:\Program Files (x86)\Windows Kits\10\Include\10.0.10240.0\ucrt</string>
    <string>C:\Program Files (x86)\Microsoft Visual Studio 14.0\VC\include</string>
    <string>C:\Program Files (x86)\Microsoft Visual Studio 14.0\VC\atlmfc\include</string>
  </SystemIncludeDirectories>
  <InterfaceIncludeDirectories>
      <string>D:\Interfaces</string>
  </InterfaceIncludeDirectories>
  <ExternalIncludeDirectories>
    <ExternalIncludeDirectory>
      <Path>D:\Externals</Path>
      <ResolveAs>External</ResolveAs>
    </ExternalIncludeDirectory>
  </ExternalIncludeDirectories>
  <ViewMode>LogicalView</ViewMode>
  <ToolsVersion>14.0</ToolsVersion>  
  <OutputFilename>MyProduct.dsi</OutputFilename>
  <CompressOutputFile>true</CompressOutputFile>  
</AnalyzerSettings>
```

## Logging

When logging is enabled the following types of logging are provided of the analysis:

When logging is enabled the following types of logging are provided of the analysis:

| Log file                      | Description                                                                          | 
|:------------------------------|:-------------------------------------------------------------------------------------|
| userMessages                  | Contains all messages as shown in the console.                                       |
| info                          | Contains information messages.                                                       |
| warnings                      | Contains warnings messages.                                                          |
| errors                        | Contains error messages.                                                             |
| exceptions                    | Contains the exceptions that occured during the analysis.                            |
| filesNotFound                 | Source files not found in the file system                                            |
| includePathsNotFound          | Include paths not found in the file system                                           |
| pathsNotResolved              | Relative include files which could not be resolved to an absolute path               |
| includeFilesNotFound          | Absolute include files which could not be found in the file system                   |
| dataModelActions              | Contains all actions on the data model like load, save and registration.             |
| dataModelRelationsNotResolved | Contains queried relations that could not be resolved.                               |                              |

The user messages log shows what percentage of the relations could be resolved. This is an indication of the
reliability of the dependency model.

[back](user_guide)
