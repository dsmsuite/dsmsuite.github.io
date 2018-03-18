---
layout: default
---
  
# Analyzing VC++ projects

The Visual studio analyzer parses C/C++ source files a determines dependencies based on header file includes.
The element hierarchy bases on directory structure of the source code. Namespaces are not taken into account.

> This analyzer provides more accurate results than the C++ analzyer, because include path per visual studio 
> project are taken into account. Therefor if you analzyer VC++ chose this analyzer and not the C++ analyzer.

This analyzer can also analyze just the project dependencies. 
This is suitable for Visual Studio solution with many projects or with a mix of C++ and .Net projects.

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

[back](user_guide)