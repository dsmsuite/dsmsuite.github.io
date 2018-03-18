---
layout: default
---

# Technical Overview

## Key components

![Technical Overview](https://dsmsuite.github.io/assets/img/user_manual/technical_overview.png "Technical Overview")

The DSM suite consists of the following components:
* An analyzer, which extracts information on elements and their relations from source, binaries or other data. An analyzer exports this information to a DSI file.
* The DSM builder which uses the DSI file to build a DSM file. 
* The DSM viewer which reads the DSM file and visualize the element hierarchy and dependencies.

The analzyers and the builder are command line tools, so they can be easily integrated into continuous integration.

> The DSI file must conform to the XSD schema described below. The DSM file format can be changed without any notice. 
> For backwards compatibility it currently it still is unchanged with respect to the original DSM plugin format, 
> but this could change in the future.

## Analyzers
A few standard analyzers are provided. If none of the provided analyzers suites your needs, 
it is possible to write an own analyzer as long as its writes the result to a DSI file.

## DSM builder
The DSM builder uses a DSI file to create a DSM file. To build the DSM file it:
* It reads the components and elements from the DSI file.
* It builds an element hierarchy as can be observed on the left side of the DSM viewer.
* It reads the relations between the elements from the file.
* It calculates the derived dependency weights for all cells.
* It flags cyclic relations, so the can accentuated in the DSM.
In the future it might also evaluate dependency rules to verify that the code conforms to the defined architecture.

## The DSI file format

Each analyzer must export its results to DSI file. To ensure that the DSM builder can only import this file,
it must conform the DSI file XSD schema below:

![DSI XSD Schema](https://dsmsuite.github.io/assets/img/user_manual/xsd_schema.png "DSI XSD Schema")

[download XSD](https://dsmsuite.github.io/downloads/dsi.xsd "XSD Schema")

# Installation

System requirements:
* Windows platform with .NET 4.5.2 framework

Download the DSM viewer and the analyzer which best suits your needs.

| Name                   | Description                                        | Download link 
|:-----------------------|:---------------------------------------------------|:---------------------------------------------------------------------------
| DSM viewer             | DSM viewer and DSM builder                         | [download](https://dsmsuite.github.io/downloads/DsmSuite.Viewer.msi).
| .Net analyzer          | Dependencies between .NET classes                  | [download](https://dsmsuite.github.io/downloads/DotNetAnalyzer.msi)
| Java analyzer          | Dependencies between Java classes                  | [download](https://dsmsuite.github.io/downloads/JdepsAnalyzer.msi)
| C++ analyzer           | Dependencies between C++ source files              | [download](https://dsmsuite.github.io/downloads/CppAnalyzer.msi)
| Visual Studio analyzer | Dependencies between VC++ source files or projects | [download](https://dsmsuite.github.io/downloads/VisualStudioAnalyzer.msi)
| UML analyzer           | Dependencies between UML elements                  | [download](https://dsmsuite.github.io/downloads/UmlAnalyzer.msi)

Before running the analyzer and builder you need to configure it using XML settings files. 

## Analyzing code

The following steps are required to be able to view dependencies in the DSM viewer.

1. Analyze code with the selected analyzer.
2. Build the DSM file.
3. Open the DSM file to show it in the viewer.

### Step 1: Running the analyzer

Follow the detailed instruction of the selected analyzer:

| Name                   | Instruction                                             |
|:-----------------------|:--------------------------------------------------------|
| .Net analyzer          | [Analyzing .Net code](user_guide_dotnet)                |
| Java analyzer          | [Analyzing Java code](user_guide_java)                  |
| C++ analyzer           | [Analyzing C/C++ code](user_guide_cpp)                  |
| Visual Studio analyzer | [Analyzing VC++ projects](user_guide_visual_studio)     |
| UML analyzer           | [Analyzing Sparx System EA UML models](user_guide_uml)  |

This step results in DSI file.

## Step 2: Running the DSM builder

### Configure the builder

The following settings are defined:

| Setting          | Description                                                          | 
|:-----------------|:---------------------------------------------------------------------|
| LoggingEnabled   | Log information to file for diagnostic purposes                      |
| InputFilename    | File name with .dsi extension used to extract dependency information |     
| OutputFilename   | File name with .dsm extension used to write DSM information          |      

### Run the analyzer

C:\Program Files (x86)\DsmSuite\DsmViewer\DsmSuite.DsmBuilder.exe BuilderSettings.xml

## Step 3: Viewing and modifying the DSM

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

