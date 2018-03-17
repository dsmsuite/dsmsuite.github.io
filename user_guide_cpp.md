---
layout: default
---

## Analyzing C/C++ code
The C++ analyzer parses C/C++ source files a determines dependencies based on header file includes.
The element hierarchy bases on directory structure of the source code. Namespaces are not taken into account.

It is important to understand that this analyzer does not have any knowledge on how to build the code. 
It therefore does not known the include paths and uses all source code directories and their nested directories as includ paths.
If filenames are unique this works quite well. How to resolve ambiguity when names are not unique can be configured.

When building VC++ projects using Visual Studio selecting the Visual Studio analyzers gives more accurate results.

## Pre requisites
* None

## Settings

The following settings are defined:

| Setting                 | Description                                                                    | 
| ------------------------|:-------------------------------------------------------------------------------|
| LoggingEnabled          | Log information to file for diagnostic purposes                                |
| RootDirectory           | Root of source code directory used to determine root of names in DSM           |
| SourceCodeDirectories   | List of directories where source codr can be found                             |
| IncludeDirectories      | List of additional directories where include files can be found. Think of system and third party include files. |
| IgnorePaths             | List of directories in the source code tree which need to be excluded          |
| MergeEnabled            | Option to merge matching include and source file to single location in the DSM |
| MergeIncludePath        | Relative path where include files can be found e.g. 'inc'                      |
| MergeSourcePath         | Relative path where source files can be found e.g. 'src'                       |
| ResolveMethod           | How to resolve ambiguity when filenames are not unique                         |
| OutputFilename          | Filename with dsi extension to which results will be written                   |     

