---
layout: default
---

# Analyzing C/C++ code

## Purpose

The C++ analyzer is intended to determine dependencies between C/C++ source files based on header file includes. 
The element hierarchy is based on the directory structure of the source code. Namespaces and types are not taken into account.

It is important to understand that this analyzer does not have any knowledge on how to build the code and 
therefore does not known the include paths used during the build. It simply uses all source code directories and their nested directories as include paths.
 
This technique works well when source filenames are unique. It this is not the case it can be ambiguous which file is intended.

How this ambiguity is resolved  can be configured:
* **Ignore**: Ignore dependencies which are ambiguous. Not all actual dependencies are reported in the DSM.
* **AddBestMatch**: Try to find the best matching file. If the algorithm gets it wrong, incorrect dependencies will be reported in the DSM.
* **AddAll**: Add possible choices. More than actual dependencies are reported in the DSM.

> When building VC++ projects using Visual Studio selecting the Visual Studio analyzers gives more reliable results, 
> because the actual include paths used during building are used.

## Pre requisites
* None

## Performing an analysis

* Create an analyzer settings file. This can be done by: 
    * Using the example below or 
	* Running the analyzer with a not existing settings file. A settings file using default settings will be created.
* Edit the analyzer settings file if required:
    * Update the SourceDirectories setting to point to the directory where the source code to be analyzed is located.
	* Update the IncludeDirectories setting to point to third party and system includes can be found.
	* Update the RootDirectory to point to the base directory of the source code.
	* Update the OutputFilename to the name of the product.
	* Set LoggingEnabled if required.
* Run the analyzer from the command line with the analyzer settings filename as argument.
* The analyzer will:
    * Parse C/C++ source files and determines dependencies based on header file includes.
	* The found elements and dependencies are written to the OutputFilename.
	* At the end of the analysis the percentage of the relations that could be resolved is shown. This is an indication of the reliability of the dependency model.
* If the percentage lower than 100% look at the log files to find out the reason.
* Optionally perform transformations on the the OutputFilename. See [User guide](user_guide) for details.
* Convert the OutputFilename into a DSM file. See [User guide](user_guide) for details.
* Open the DSM file in the Viewer.

## Command line usage

Use the following command to run a analysis:

```
"C:\Program Files\DsmSuite\Analyzers\C++\DsmSuite.Analyzer.Cpp.Exe" AnalyzerSettings.xml
```

## Settings

The following settings are defined:

| Setting                 | Description                                                                    | 
|:------------------------|:-------------------------------------------------------------------------------|
| LoggingEnabled          | Log information for diagnostic purposes                                        |
| RootDirectory           | Root of source code directory used to determine root of names in DSM           |
| SourceDirectories       | List of directories where source code can be found                             |
| IncludeDirectories      | List of additional directories where include files can be found. Think of system and third party include files. |
| IgnorePaths             | List of directories in the source code tree which need to be excluded          |
| ResolveMethod           | How to resolve ambiguity when filenames are not unique                         |
| OutputFilename          | Filename with dsi extension to which results will be written                   |     
| CompressOutputFile      | Compress output                                                                |

## AnalyzerSettings.xml example 

Example for analyzing C++ in a D:\MyProject source directory.

```xml
<?xml version="1.0" encoding="utf-8"?>
<AnalyzerSettings xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
  <LogLevel>None</LogLevel>
  <Input>
    <RootDirectory>C:\</RootDirectory>
    <SourceDirectories>
      <string>C:\</string>
    </SourceDirectories>
    <ExternalIncludeDirectories>
      <string>C:\</string>
    </ExternalIncludeDirectories>
    <IgnorePaths>
      <string>C:\</string>
    </IgnorePaths>
  </Input>
  <Analysis>
    <ResolveMethod>AddBestMatch</ResolveMethod>
  </Analysis>
  <Transformation>
    <IgnoredNames />
    <AddTransitiveIncludes>false</AddTransitiveIncludes>
    <HeaderSourceFileMergeStrategy>None</HeaderSourceFileMergeStrategy>
    <MergeHeaderAndSourceFileDirectoryRules>
      <TransformationMergeRule>
        <From>inc.</From>
        <To>src.</To>
      </TransformationMergeRule>
    </MergeHeaderAndSourceFileDirectoryRules>
  </Transformation>
  <Output>
    <Filename>Output.dsi</Filename>
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
| exceptions                    | Contains the exceptions that occured during the analysis.                            |
| filesNotFound                 | Source files not found in the file system                                            |
| includePathsNotFound          | Include paths not found in the file system                                           |
| pathsNotResolved              | Relative include files which could not be resolved to an absolute path               |
| includeFilesAmbigious         | Relative include files which can be resolved to multiple absolute include files      |
| includeFilesNotFound          | Absolute include files which could not be found in the file system                   |
| dataModelActions              | Contains all actions on the data model like load, save and registration.             |
| dataModelRelationsNotResolved | Contains queried relations that could not be resolved.                               |                             |

[back](user_guide)
