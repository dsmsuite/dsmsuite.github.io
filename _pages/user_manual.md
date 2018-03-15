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

![Technical Overview](https://dsmsuite.github.io/assets/img/user_manual/technical_overview.png "Technical Overview")

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

The DSM builder can only import files according the DSI fiel format:

![DSI XSD Schema](https://dsmsuite.github.io/assets/img/user_manual/xsd_schema.png "DSI XSD Schema")

## Installation
Download and install the DSM viewer and the analyzer required for your programming environment.

[dsm viewer and builder] (https://dsmsuite.github.io/downloads/DsmSuite.Viewer.msi)
[.Net analyzer] (https://dsmsuite.github.io/downloads/DotNetAnalyzer.msi)
[java analyzer] (https://dsmsuite.github.io/downloads/JdepsAnalyzer.msi)
[C++ analyzer] (https://dsmsuite.github.io/downloads/CppAnalyzer.msi)
[Visual Studio analyzer] (https://dsmsuite.github.io/downloads/VisualStudioAnalyzer.msi)
[UML analyzer] (https://dsmsuite.github.io/downloads/UmlAnalyzer.msi)

Before running the analyzer and builder you need to configure it using XML settings files. Example configuration
and batch files are put into the program files directory by the installer. 
The XML schema file dsi.xsd needs to be copied to the directory where your run the dsm builder.

# Running the analyzer

As a first step you need to run an analyzer to extract dependencies.

## .Net analyzer

This analyzer parses assemblies using Mono.Cecil to determine dependencies between .Net classes.
Hierarchy bases ion namespaces.

### Pre requisites
None

### Configuration

The following settings are defined for this analyzer:

| Setting           | Description   | 
| ------------------|:-------------:|
| LoggingEnabled    | Log information to file for diagnostic purposes |
| AssemblyDirectory | Directory where assemblies to be analyzed can be found     |
| OutputFilename    | File name with dsi extension to which results will be written      |

## java analyzer

This analyzer reads a Jdeps .out file to determine dependencies betweeen Java classes.
Hierarchy bases ion namespaces.

### Pre requisites
Java SDK 8 installed which contains Jdeps.

### Configuration

The following settings are defined for this analyzer:

| Setting            | Description   | 
| -------------------|:-------------:|
| LoggingEnabled    | Log information to file for diagnostic purposes |
| JdepsDotInputFile  | centered      |
| OutputFilename    | File name with dsi extension to which results will be written      

## C++ analyzer
This analyzer parses C/C++ source files a determines
Hierarchy bases ion directory structure.

### Pre requisites
None

### Configuration

The following settings are defined for this analyzer:

| Setting                           | Description   | 
| ----------------------------------|:-------------:|
| LoggingEnabled    | Log information to file for diagnostic purposes |
| RootDirectory                     | Root of source code directory used to determine root of names in DSM |
| SourceCodeDirectories             | List of directories where source cod can be found      |
| AdditionalIncludeDirectories      |  List of addtional directories where include files can be found. Think of system and third party include files|
| IgnorePaths                       | List of directories in the source direrctories which need to be excluded      |
| JoinRelativeSourceAndIncludePaths | Locate cpp and h file together     |
| RelativeIncludePath               | centered      |
| RelativeSourcePath                | are neat      |
| ResolveAmbigiousRelations         | are neat      |
| OutputFilename    | File name with dsi extension to which results will be written      

## Visual Studio analyzer

### Pre requisites
Visual Studio 2012 or higher

### Configuration
The following settings are defined:

| Setting                           | Description   | 
| ----------------------------------|:-------------:|
| LoggingEnabled    | Log information to file for diagnostic purposes |
| SolutionFilename                  | centered      |
| AnalyzeMode                       | are neat      |
| SystemIncludeDirectories          | right-aligned |
| EnvironmentVariables              | centered      |
| MergeSourceAndIncludeFiles        | are neat      |
| RelativeIncludePath               | centered      |
| RelativeSourcePath                | are neat      |
| OutputFilename    | File name with dsi extension to which results will be written      

## UML analyzer

### Pre requisites
Sparx Systems Enterprise Architect installed

### Configuration

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
| LoggingEnabled    | Log information to file for diagnostic purposes |
| InputFilename    | File name with dsi extension used as input |     
| OutputFilename    | File name with dsm extension to which results will be written      

## Viewing and modifying the DSM

![DSM viewer](https://dsmsuite.github.io/assets/img/user_manual/dsm_viewer.png "DSM viewer")

The DSM viewer has the following features:

* Opening DSM file
* Modifying the DSM file 	
	* Move elements up or down
	* Partition a section of the DSM model
	* Saving the changes in the DSM file
* Changing the view of the DSM
	* Change the zoom level
	* Highlight cyclic dependencies on or off
* Reporting
	* Report all cyclic dependencies
	* Report all dependency between two elements by selecting a cell and right clicking it
	
	



