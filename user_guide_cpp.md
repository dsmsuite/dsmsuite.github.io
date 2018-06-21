---
layout: default
---

# Analyzing C/C++ code
The C++ analyzer parses C/C++ source files and determines dependencies based on header file includes.
The element hierarchy is based on the directory structure of the source code. Namespaces are not taken into account.

It is important to understand that this analyzer does not have any knowledge on how to build the code and 
therefore does not known the include paths used during the build.It simply uses all source code directories and their nested directories as include paths.
 
This technique works well when source filenames are unique. It this is not the case it can be ambiguous which file is intended.

How this ambiguity is resolved  can be configured:
* **Ignore**: Ignore dependencies which are ambiguous. Not all actual dependencies are reported in the DSM.
* **AddBestMatch**: Try to find the best matching file. If the algorithm gets it wrong, incorrect dependencies will be reported in the DSM.
* **AddAll**: Add possible choices. More than actual dependencies are reported in the DSM.

> When building VC++ projects using Visual Studio selecting the Visual Studio analyzers gives more reliable results, 
> because the actual include paths used during building are used.

## Pre requisites
* None

## Settings

The following settings are defined:

| Setting                 | Description                                                                    | 
| ------------------------|:-------------------------------------------------------------------------------|
| LoggingEnabled          | Log information to file for diagnostic purposes                                |
| RootDirectory           | Root of source code directory used to determine root of names in DSM           |
| SourceDirectories       | List of directories where source code can be found                             |
| IncludeDirectories      | List of additional directories where include files can be found. Think of system and third party include files. |
| IgnorePaths             | List of directories in the source code tree which need to be excluded          |
| ResolveMethod           | How to resolve ambiguity when filenames are not unique                         |
| OutputFilename          | Filename with dsi extension to which results will be written                   |     

## Performing analysis

Use the following command:

DsmSuite.Analyzer.Cpp.exe AnalyzerSettings.xml

## AnalyzerSettings.xml example 

Example for analyzing C++ in a D:\MyProject source directory.

```xml
<?xml version="1.0" encoding="utf-8"?>
<AnalyzerSettings xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" 
                  xmlns:xsd="http://www.w3.org/2001/XMLSchema">
  <LoggingEnabled>false</LoggingEnabled>
  <RootDirectory> D:\MyProject</RootDirectory>
  <SourceDirectories>
    <string> D:\MyProject</string>
  </SourceDirectories>
  <IncludeDirectories>
    <string>C:\Program Files (x86)\Windows Kits\10\Include</string>
    <string>C:\Program Files (x86)\Microsoft Visual Studio 14.0\VC\include</string>
  </IncludeDirectories>
  <IgnorePaths>
    <string> D:\MyProject\Test</string>
  </IgnorePaths>
  <ResolveMethod>AddBestMatch</ResolveMethod>
  <OutputFilename>Output.dsi</OutputFilename>
</AnalyzerSettings>
```

[back](user_guide)
