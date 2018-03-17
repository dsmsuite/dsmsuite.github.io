---
layout: default
---

## Technical Overview

The DSM suite consists of the following elements:

![Technical Overview](https://dsmsuite.github.io/assets/img/user_manual/technical_overview.png "Technical Overview")

* An analyzer, which extracts information elements and their relations from source, binaries or other data. An analyzer exports this information to a DSI file.
* The DSM builder which uses the output of the analyzer to build a DSM file. 
* The DSM viewer which reads the DSM file and visualize the dependencies.

In the software design the analyzers are fully separated from the DSM viewer and builder.

A few standard analyzers are provided. If none of the provided analyzers suites your needs, 
it is possible to write an own analyzer as long as the 
output it produces confirm the XML schema used by the DSM builder.

### The DSI file format

Each analyzer must export its results to DSI file. To ensure that the DSM builder can only import this file,
it must conform the DSI file XSD schema below:

![DSI XSD Schema](https://dsmsuite.github.io/assets/img/user_manual/xsd_schema.png "DSI XSD Schema")

[download XSD]{https://dsmsuite.github.io/downloads/dsi.xsd "XSD Schema")

## Installation

Download the DSM viewer and the analyzer which best suits your needs.

| Name                   | Description                                        | Download link 
|:-----------------------|:---------------------------------------------------|:---------------------------------------------------------------------------
| DSM viewer             | DSM viewer and DSM builder                         | [download](https://dsmsuite.github.io/downloads/DsmSuite.Viewer.msi).
| .Net analyzer          | Dependencies between .NET classes                  | [download](https://dsmsuite.github.io/downloads/DotNetAnalyzer.msi)
| Java analyzer          | Dependencies between Java classes                  | [download](https://dsmsuite.github.io/downloads/JdepsAnalyzer.msi)
| C++ analyzer           | Dependencies between C++ source files              | [download](https://dsmsuite.github.io/downloads/CppAnalyzer.msi)
| Visual Studio analyzer | Dependencies between VC++ source files or projects | [download](https://dsmsuite.github.io/downloads/VisualStudioAnalyzer.msi)
| UML analyzer           | Dependencies between UML elements                  | [download](https://dsmsuite.github.io/downloads/UmlAnalyzer.msi)

Before running the analyzer and builder you need to configure it using XML settings files. Example configuration
and batch files are put into the program files directory by the installer can be found here. 
Also the XML schema file dsi.xsd needs to be copied to the directory where your run the dsm builder.

## Analyzing code

The following steps are required to be able to view dependencies in the DSM viewer.

1. Analyze code with the selected analyzer
2. Building the DSM file
3. Open the DSM file to show it in the viewer.

### Step 1: Running the analyzer

Follow the detailed instruction f the selected analyzer:

| Name                   | Instruction                                             |
|:-----------------------|:--------------------------------------------------------|
| .Net analyzer          | [analyzing .Net code](user_guide_dotnet)                |
| Java analyzer          | [analyzing Java code](user_guide_java)                  |
| C++ analyzer           | [analyzing C/C++ code](user_guide_cpp)                  |
| Visual Studio analyzer | [analyzing VC++ projects](user_guide_visual_studio)     |
| UML analyzer           | [analyzing Sparx System EA UML models](user_guide_uml)  |

The result of the analyzes step is a output file conforming to DSI file XSD schema.

## Running the DSM builder

### Purpose

The DSM builder uses a DSI file to create a DSM file. To build the DSM file it:
* It reads the components and elements from the DSI file.
* It builds an element hierarchy as can be observed on the left side of the DSM viewer.
* It reads the relations between the elements from the file.
* It calculates the derived dependency weights for all cells.
* It flags cyclic relations, so the can accentuated in the DSM.

### Settings

The following settings are defined:

| Setting          | Description                                                                   | 
|:-----------------|:------------------------------------------------------------------------------|
| LoggingEnabled   | Log information to file for diagnostic purposes                               |
| InputFilename    | File name with .dsi extension used as input to extract dependency information |     
| OutputFilename   | File name with .dsm extension used as output to write DSM information         |      

> The DSI file must conform to the predefined XSD schema. The DSM file format can be changed without any notice. 
> Currently it still is unchanged with respect to the original DSM plugin format.

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

