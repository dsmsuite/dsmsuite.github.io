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

[back](user_guide)
