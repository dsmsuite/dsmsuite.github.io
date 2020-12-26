---
layout: default
---

# Analyzing C/C++ code

## Purpose

The C++ analyzer is intended to determine dependencies between C/C++ source files based on header file includes. 
The element hierarchy is based on the directory structure of the source code. Namespaces and types are not taken into account.

### Potential ambiguity

It is important to understand that this analyzer does not have any knowledge on how to build the code and 
therefore does not known the include paths used during the build. It simply uses all source code directories and their nested directories as include paths.
 
This technique works well when source filenames are unique. It this is not the case it can be ambiguous which file is intended.

How this ambiguity is resolved  can be configured:
* **Ignore**: Ignore dependencies which are ambiguous. Not all actual dependencies are reported in the DSM.
* **AddBestMatch**: Try to find the best matching file. If the algorithm gets it wrong, incorrect dependencies will be reported in the DSM.
* **AddAll**: Add possible choices. More than actual dependencies are reported in the DSM.

> When building VC++ projects using Visual Studio selecting the Visual Studio analyzers gives more reliable results, 
> because the actual include paths used during building are used.

### Merging source and header files

A C++ module consists in most cases of a header and a source file. In many cases externally visible header files are located in a different directory the private header files or source files.
For proper analysis it is better to merge them to a single location in the DSM. Three strategies are possible:
* **No merge**: The model is unchanged.
* **Move header file**: The header file is move next to the source file with an identical name.
* **Move header file directory**: Entire header file directory contents is moved to a source file directory based on a configurable naming rule.

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
* Convert the OutputFilename into a DSM file. See [User guide](user_guide) for details.
* Open the DSM file in the Viewer.

## Command line usage

Use the following command to run a analysis:

```
"C:\Program Files\DsmSuite\Analyzers\C++\DsmSuite.Analyzer.Cpp.Exe" AnalyzerSettings.xml
```

## Settings

The following settings are defined:

| Setting                                               | Description                                                                                                     | 
|:------------------------------------------------------|:----------------------------------------------------------------------------------------------------------------|
| LogLevel                                              | Log level as described above                                                                                    |
| Input.RootDirectory                                   | Root of source code directory used to determine root of names in DSM                                            |
| Input.SourceDirectories                               | List of directories where source code can be found                                                              |
| Input.IncludeDirectories                              | List of additional directories where include files can be found. Think of system and third party include files. |
| Input.IgnorePaths                                     | List of directories in the source code tree which need to be excluded                                           |
| Analysis.ResolveMethod                                | How to resolve ambiguity when filenames are not unique                                                          |
| Transformation.IgnoredNames                           | Names in input data which will be ignore. Defines as regular expression.                                        |  
| Transformation.AddTransitiveIncludes                  |                                                                                                                 |  
| Transformation.HeaderSourceFileMergeStrategy          |                                                                                                                 |  
| Transformation.MergeHeaderAndSourceFileDirectoryRules |                                                                                                                 |  
| Output.Filename                                       | Filename with dsi extension to which results will be written                                                    |
| Output.Compress                                       | Compress output file                                                                                            |

## AnalyzerSettings.xml example 

Example for analyzing C++ in a D:\MyProject source directory.

```xml
<?xml version="1.0" encoding="utf-8"?>
<AnalyzerSettings xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
  <LogLevel>Error</LogLevel>
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
## Additional Logging

The following additional logging files defined.

When logging is enabled the following types of logging are provided of the analysis:

| Log file                      | Description                                                                          | 
|:------------------------------|:-------------------------------------------------------------------------------------|
| filesNotFound.log             | Source files not found in the file system                                            |
| includePathsNotFound.log      | Include paths not found in the file system                                           |
| pathsNotResolved.log          | Relative include files which could not be resolved to an absolute path               |
| includeFilesAmbigious.log     | Relative include files which can be resolved to multiple absolute include files      |
| includeFilesNotFound.log      | Absolute include files which could not be found in the file system                   |


[back](user_guide)
