---
layout: page
title: User manual title
subtitle: User manual subtitle
desc: User manual description
permalink: /user_manual/
---

User manual text

## Technical Overview

The DSM suite consists of the following elements:

[picture]

* A dependency analyzer. The following analzyers are currently supported:
	* .Net: Analyzes dependencies between .NET classes using .NET binaries as input
	* Java: Analyzes dependencies between Java classes based Jdeps out files. Jdeps is part of Java SDK8.
	* C++: Analyzes source file include dependencies between C/C++ files.
	* Visual Studio: Analyzes source file include or project dependencies of a Visual Studio solution.
	* UML: Analyzes dependencies between UML elements in a Sparx Systems Enterprise Architect UML model.
* The DSM builder which uses the output of the analyzer to build a DSM file.
* The DSM viewer which reads the DSM file and visualize the dependencies.

In the software design the analyzers are fully separated from the DSM viewer and builder.

If none of the provided analyzers suites your needs, it is possible to write an own analyzer as long as the 
output it produces confirm the XML schema used by the DSM builder.

### The DSI dependency file format

## Installation
Download and install the DSM viewer and the analyzer required for your programming environment.

[dsm viewer and builder]
[.Net analyzer]
[java analyzer]
[C++ analyzer]
[Visual Studio analyzer]
[UML analyzer]

Before running the analyzer and builder you need to configure it using XML settings files. Example configuration
and batch files are put into the program files directory by the installer. 
The XML schema file dsi.xsd needs to be copied to the directory where your run the dsm builder.

# Running the analyzer

As a first step you need to run an analyzer to extract dependencies.

## .Net analyzer
The following settings are defined:

| Setting           | Description   | 
| ------------------|:-------------:|
| LoggingEnabled    | right-aligned |
| AssemblyDirectory | centered      |
| OutputFilename    | are neat      |

## java analyzer
The following settings are defined:

| Setting            | Description   | 
| -------------------|:-------------:|
| LoggingEnabled     | right-aligned |
| JdepsDotInputFile  | centered      |
| OutputFilename     | are neat      |

## C++ analyzer
The following settings are defined:

| Setting                           | Description   | 
| ----------------------------------|:-------------:|
| LoggingEnabled                    | right-aligned |
| RootDirectory                     | centered      |
| SourceCodeDirectories             | are neat      |
| AdditionalIncludeDirectories      | right-aligned |
| IgnorePaths                       | centered      |
| JoinRelativeSourceAndIncludePaths | are neat      |
| RelativeIncludePath               | centered      |
| RelativeSourcePath                | are neat      |
| ResolveAmbigiousRelations         | are neat      |
| OutputFilename                    | are neat      |

## Visual Studio analyzer
The following settings are defined:

| Setting                           | Description   | 
| ----------------------------------|:-------------:|
| LoggingEnabled                    | right-aligned |
| SolutionFilename                  | centered      |
| AnalyzeMode                       | are neat      |
| SystemIncludeDirectories          | right-aligned |
| EnvironmentVariables              | centered      |
| MergeSourceAndIncludeFiles        | are neat      |
| RelativeIncludePath               | centered      |
| RelativeSourcePath                | are neat      |
| OutputFilename                    | are neat      |

## UML analyzer
The following settings are defined:

# Running the DSM builder

The DSM builder uses the analyzer output file to create a DSM file. To build the DSM file it:
* It reads the components and elements from the file.
* It builds an element hierarchy.
* It reads the relations between the elements from the file.
* It calculates the weights.
* It flag cyclic relation, so the can show in yellow in the DSM.

The following settings are defined:

| Setting                           | Description   | 
| ----------------------------------|:-------------:|
| LoggingEnabled                    | right-aligned |
| InputFilename                     | centered      |
| OutputFilename                    | are neat      |

## Viewing and modifying the DSM




