---
layout: default
---
  
# Analyzing VC++ projects

The Visual studio analyzer can analyze in two ways:
* **IncludeDependencies**: The Visual studio analyzer parses C/C++ source files a determines dependencies based on header file includes. 
* **ProjectDependencies**: This analyzer can also analyze just the project dependencies. This is suitable for Visual Studio solution with many projects or with a mix of C++ and .Net projects.
 
The element hierarchy used to visualize the DSM can be based on:
* **PhysicalView**: The element hierarchy is based on directories. 
* **LogicalView**: The element hierarchy is based on solution folders and project filters. 
Namespaces are not taken into account.

> This analyzer provides more accurate results than the C++ analyzer, because include path per visual studio 
> project are taken into account. Therefor if you analyzer VC++ chose this analyzer and not the C++ analyzer.

## Pre requisites
* Visual Studio 2012 or higher.

## Settings

The following settings are defined:

| Setting                  | Description                                                                    | 
|:-------------------------|:-------------------------------------------------------------------------------|
| LoggingEnabled           | Log information to file for diagnostic purposes                                |
| SolutionFilename         | Full path to visual studio solution file                                       |
| AnalyzeMode              | Analyze source file or project dependencies                                    |
| ViewMode                 | Based the element hierarchy on directorie or solution folders and project filters | 
| IncludeDirectories       | List of additional directories where include files can be found. Think of system and third party include files. |
| EnvironmentVariables     | List of key/value pairs. It replaces '$(key)' in include paths by 'Value'       |
| OutputFilename           | Filename with dsi extension to which results will be written                   |   

## Performing analysis

Use the following command:

DsmSuite.Analyzer.VisualStudio.exe AnalyzerSettings.xml

If the setting file does not exist a default one will be created.

## AnalyzerSettings.xml example 

Example for analyzing C++ in a D:\MyProject\MyProject.sln directory.

```xml
<?xml version="1.0" encoding="utf-8"?>
<AnalyzerSettings xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema">
  <LoggingEnabled>false</LoggingEnabled>
  <SolutionFilename>D:\MyProject\MyProject.sln</SolutionFilename>
  <AnalyzeMode>IncludeDependencies</AnalyzeMode>
  <ViewMode>LogicalView</ViewMode>
  <RootDirectory>D:\MyProject</RootDirectory>
  <IncludeDirectories>
    <string>C:\Program Files (x86)\Windows Kits\10\Include</string>
    <string>C:\Program Files (x86)\Microsoft Visual Studio 14.0\VC\include</string>
  </IncludeDirectories>
  <EnvironmentVariables>
    <EnvironmentVariable>
      <Key>SolutionDir</Key>
      <Value>D:\MyProject</Value>
    </EnvironmentVariable>
  </EnvironmentVariables>
  <OutputFilename>Output.dsi</OutputFilename>
</AnalyzerSettings>
```

[back](user_guide)
