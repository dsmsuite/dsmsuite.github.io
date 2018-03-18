---
layout: default
---
  
# Analyzing VC++ projects

The Visual studio analyzer can work in two modes:
* **IncludeDependencies**: The Visual studio analyzer parses C/C++ source files a determines dependencies based on header file includes. The element hierarchy bases on directory structure of the source code. Namespaces are not taken into account.
* **ProjectDependencies**: This analyzer can also analyze just the project dependencies. This is suitable for Visual Studio solution with many projects or with a mix of C++ and .Net projects.
 
> This analyzer provides more accurate results than the C++ analyzer, because include path per visual studio 
> project are taken into account. Therefor if you analyzer VC++ chose this analyzer and not the C++ analyzer.

## Pre requisites
* Visual Studio 2012 or higher.

## Settings

The following settings are defined:

| Setting                  | Description                                                                    | 
| -------------------------|:-------------------------------------------------------------------------------|
| LoggingEnabled           | Log information to file for diagnostic purposes                                |
| SolutionFilename         | Full path to visual studio solution file                                       |
| AnalyzeMode              | Analyze source file or project dependencies                                    |
| IncludeDirectories       | List of additional directories where include files can be found. Think of system and third party include files. |
| EnvironmentVariables     | List of key/value pairs. It replace '$(key)' in include paths by 'Value'       |
| MergeEnabled             | Option to merge matching include and source file to single location in the DSM |
| MergeIncludePath         | Relative path where include files can be found e.g. 'inc'                      |
| MergeSourcePath          | Relative path where source files can be found e.g. 'src'                       |
| OutputFilename           | Filename with dsi extension to which results will be written                   |   

## Example

Example for analyzing C++ in a D:\MyProject\MyProject.sln directory.

**AnalyzerSettings.xml**

```xml
<?xml version="1.0" encoding="utf-8"?>
<AnalyzerSettings xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" 
                  xmlns:xsd="http://www.w3.org/2001/XMLSchema">
  <LoggingEnabled>false</LoggingEnabled>
  <SolutionFilename>D:\MyProject\MyProject.sln</SolutionFilename>
  <AnalyzeMode>IncludeDependencies</AnalyzeMode>
  <RootDirectory>D:\MyProject</RootDirectory>
  <IncludeDirectories>
    <string>C:\Program Files (x86)\Windows Kits\10\Include\10.0.14393.0</string>
    <string>C:\Program Files (x86)\Microsoft Visual Studio 14.0\VC\include</string>
  </IncludeDirectories>
  <EnvironmentVariables>
    <EnvironmentVariable>
      <Key>FrameworkSdkDir</Key>
      <Value>C:\Program Files (x86)\Windows Kits\10\Include</Value>
    </EnvironmentVariable>
  </EnvironmentVariables>
  <MergeEnabled>false</MergeEnabled>
  <MergeIncludePath>include</MergeIncludePath>
  <MergeSourcePath>src</MergeSourcePath>
  <OutputFilename>MyProject.dsi</OutputFilename>
</AnalyzerSettings>
```

**BuilderSettings.xml***

```xml
<?xml version="1.0" encoding="utf-8"?>
<BuilderSettings xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" 
                 xmlns:xsd="http://www.w3.org/2001/XMLSchema">
  <LoggingEnabled>false</LoggingEnabled>
  <InputFilename>MyProject.dsi</InputFilename>
  <OutputFilename>MyProject.dsm</OutputFilename>
</BuilderSettings>
```

**Analyze.bat**

```
DsmSuite.Analyzer.VisualStudio.exe AnalyzerSettings.xml
DsmSuite.DsmBuilder.exe BuilderSettings.xml
```

[back](user_guide)