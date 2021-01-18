---
layout: default
---
  
# Analyzing VC++ projects

## Purpose

The Visual studio analyzer is intended to determine dependencies between C/C++ source files based on header file includes. 
Also IDL files and their generated files are taken into account.

> This analyzer used the Microsoft.Build.Evaluation API. For proper analysis it is required that solutions compile successfully.

### Selectable model view

The element hierarchy used to visualize the DSM can be based on:
* **DirectoryView**: The element hierarchy is based on directories. 
* **SolutionView**: The element hierarchy is based on solution folders and project filters. 
Namespaces and types are not taken into account.

### Merging source and header files

A C++ module consists in most cases of a header and a source file. In many cases externally visible header files are located in a different directory the private header files or source files.
For proper analysis it is better to merge them to a single location in the DSM. Three strategies are possible:
* **None**: The model is unchanged.
* **MoveHeaderFileToSourceFile**: The header file is move next to the source file with an identical name.
* **MergeHeaderAndSourceFileDirectory**: Entire header file directory contents is moved to a source file directory based on a configurable naming rule.

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
	* Update LogLevel if required.
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
* Import the DSI file in the DSM viewer.

## Command line usage

Use the following command to run a analysis:

```
"C:\Program Files\DsmSuite\Analyzers\VisualStudio\DsmSuite.Analyzer.VisualStudio.exe" AnalyzerSettings.xml
```

## Settings

The following settings are defined:

| Setting                                | Description                                                                                                     | 
|:---------------------------------------|:----------------------------------------------------------------------------------------------------------------|
| LogLevel                               | Log level as described above                                                                                    |
| Input.Filename                         | Full path to visual studio solution files organized in named or unnamed groups                                  |
| Input.RootDirectory                    |                                                                                                                 |
| Input.SystemIncludeDirectories         | List of directories where system include files can be found.                                                    |
| Input.ExternalIncludeDirectories       | List of directories where third party include files can be found.                                               |
| Input.InterfaceIncludeDirectories      | List of directories where interface include files can be found. These can be clones.                            |
| Analysis.ViewMode                      | Base the element hierarchy on directories or solution folders and project filters                               | 
| Analysis.ToolsVersion                  | Should match installed version (14.0=VS2015 15.0=VS2017)                                                        |
| Transformation.IgnoredNames            | Names in input data which will be ignore. Defines as regular expression.                                        |  
| Transformation.AddTransitiveIncludes   | Add transitive includes.                                                                                        |  
| Transformation.ModuleMergeStrategy     | Strategy to merge source and related header file into a single module.                                          |  
| Transformation.ModuleMergeRules        | Rules to merge header and source file directories.                                                              |   
| Output.Filename                        | Filename with dsi extension to which results will be written                                                    |
| Output.Compress                        | Compress output file                                                                                            |

## AnalyzerSettings.xml example 

Example for analyzing C++ in a D:\MyProject\MyProject.sln directory.

```xml
<?xml version="1.0" encoding="utf-8"?>
<AnalyzerSettings xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
  <LogLevel>Error</LogLevel>
  <Input>
    <Filename>C:\Example.sln</Filename>
    <RootDirectory>C:\</RootDirectory>
    <SystemIncludeDirectories>
      <string>C:\Program Files (x86)\Windows Kits\8.1\Include\um</string>
      <string>C:\Program Files (x86)\Windows Kits\8.1\Include\shared</string>
      <string>C:\Program Files (x86)\Windows Kits\10\Include\10.0.10240.0\ucrt</string>
      <string>C:\Program Files (x86)\Microsoft Visual Studio 14.0\VC\include</string>
      <string>C:\Program Files (x86)\Microsoft Visual Studio 14.0\VC\atlmfc\include</string>
    </SystemIncludeDirectories>
    <ExternalIncludeDirectories>
      <ExternalIncludeDirectory>
        <Path>C\:External</Path>
        <ResolveAs>External</ResolveAs>
      </ExternalIncludeDirectory>
    </ExternalIncludeDirectories>
    <InterfaceIncludeDirectories />
  </Input>
  <Analysis>
    <ToolsVersion>14.0</ToolsVersion>
    <ViewMode>SolutionView</ViewMode>
  </Analysis>
  <Transformation>
    <IgnoredNames />
    <AddTransitiveIncludes>false</AddTransitiveIncludes>
    <HeaderSourceFileMergeStrategy>None</HeaderSourceFileMergeStrategy>
    <MergeHeaderAndSourceFileDirectoryRules>
      <TransformationMergeRule>
        <From>Header Files.</From>
        <To>Source Files.</To>
      </TransformationMergeRule>
    </MergeHeaderAndSourceFileDirectoryRules>
  </Transformation>
  <Output>
    <Filename>Output.dsi</Filename>
    <Compress>true</Compress>
  </Output>
</AnalyzerSettings>
```

## Additional Logging

The following additional logging files defined.

| Log file                      | Description                                                                          | 
|:------------------------------|:-------------------------------------------------------------------------------------|
| filesNotFound                 | Source files not found in the file system                                            |
| includePathsNotFound          | Include paths not found in the file system                                           |
| pathsNotResolved              | Relative include files which could not be resolved to an absolute path               |
| includeFilesNotFound          | Absolute include files which could not be found in the file system                   |

The user messages log shows what percentage of the relations could be resolved. This is an indication of the
reliability of the dependency model.

[back](user_guide)
