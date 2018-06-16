---
layout: default
---

# Technical Overview

![Technical Overview](https://dsmsuite.github.io/assets/img/user_manual/technical_overview.png "Technical Overview")

*Figure 1: DSM Suite Key Components*

The analyzers, transformer and the builder are command line tools, so they can be easily integrated into continuous integration.

The DSM suite consists of the following components:

## Analyzer
An analyzer, which extracts information on elements and their relations from source, binaries or other data. An analyzer exports this information to a DSI file.

A few standard analyzers are provided. If none of the provided analyzers suites your needs, 
it is possible to write your own analyzer as long as its writes the result to a DSI file.

> The DSI file must conform to the XSD schema described below. The DSM file format can be changed without any notice. 
> For backwards compatibility it currently it still is unchanged with respect to the original DSM plug in format, 
> but this could change in the future.

## Transformer
A transformer can be used to apply transformations on the DSI file. These transformations can for example:
* Add transitive relations e.g. for C++ not only direct includes, but also indirect includes.
* Transform elements, so they are moved in the element hierarchy. This feature can be used to analysis potential refactorings  as as described in the [DSM Overview](dsm_overview).

## DSM builder
The DSM builder uses a DSI file to create a DSM file. To build the DSM file it:
* Reads the components and elements from the DSI file.
* Builds an element hierarchy as can be observed on the left side of the DSM viewer.
* Reads the relations between the elements from the file.
* Calculates the derived dependency weights for all cells.
* Flags cyclic relations, so the can emphasised in the DSM.
In the future it might also evaluate dependency rules to verify that the code conforms to the defined architecture.

## DSM Viewer
The DSM viewer reads the DSM file and visualizes the element hierarchy and dependencies.

# The DSI file format

Each analyzer must export its results to DSI file. To ensure that the DSM builder can import this file,
it must conform the DSI file XSD schema below:

![DSI XSD Schema](https://dsmsuite.github.io/assets/img/user_manual/xsd_schema.png "DSI XSD Schema")

```xml
<?xml version="1.0" encoding="utf-8"?>
<xs:schema xmlns="urn:dsi-schema" 
	   attributeFormDefault="unqualified" 
	   elementFormDefault="qualified" 
	   xmlns:xs="http://www.w3.org/2001/XMLSchema">
  <xs:element name="system">
    <xs:complexType>
      <xs:sequence>
        <xs:element name="elements">
          <xs:complexType>
            <xs:sequence>
              <xs:element minOccurs="0" maxOccurs="unbounded" name="element">
                <xs:complexType>
                  <xs:attribute name="id"       type="xs:integer" use="required" />
                  <xs:attribute name="name"     type="xs:string"  use="required" />
                  <xs:attribute name="type"     type="xs:string"  use="optional" />		  
                  <xs:attribute name="source"   type="xs:string"  use="optional" />
                </xs:complexType>
              </xs:element>
            </xs:sequence>
          </xs:complexType>
        </xs:element>
        <xs:element name="relations">
          <xs:complexType>
            <xs:sequence>
              <xs:element minOccurs="0" maxOccurs="unbounded" name="relation">
                <xs:complexType>
                  <xs:attribute name="providerId" type="xs:integer" use="required" />
                  <xs:attribute name="consumerId" type="xs:integer" use="required" />
                  <xs:attribute name="type"       type="xs:string"  use="optional" />
	          <xs:attribute name="weight"     type="xs:integer" use="required" />
                </xs:complexType>
              </xs:element>
            </xs:sequence>
          </xs:complexType>
        </xs:element>
      </xs:sequence>
    </xs:complexType>
  </xs:element>
</xs:schema>
```

[download XSD](https://dsmsuite.github.io/downloads/dsi.xsd "XSD Schema")

Each element has the following properties:

| Name          | Description                                                   |
|:--------------|:--------------------------------------------------------------|
| id            | An unique integer value defining the element.                     |
| name          | An unique name of the element. The name consists of dot separated elements. Each element represents a part in a elemenmt hierarchy e.g. a directory or a namespace.               |
| type          | The type of element e.g. class, enum of file.                 |
| source        | The source from which the element was generated e.g. the full path of the source file.             |

Each relation has the following properties:

| Name                   | Description                                          |
|:-----------------------|:-----------------------------------------------------|
| providerId             | The id of the provider element.                      |
| consumerId             | The id of the consumer element.                      |
| type                   | The type of relation e.g. include, inherit, realize. |
| weight                 | The strength of the relation.                        |

# Installation

System requirements:
* Windows platform with .NET 4.5.2 framework

Download the viewer and the analyzer which best suits your needs. Optionally you can download the transformer, when needed.

| Name                   | Description                                        | Download link                                                                       |
|:-----------------------|:---------------------------------------------------|:------------------------------------------------------------------------------------|
| DSM viewer             | DSM viewer and builder                             | [download](https://dsmsuite.github.io/downloads/DsmSuite.Viewer.msi)                |
| .Net analyzer          | Dependencies between .NET classes                  | [download](https://dsmsuite.github.io/downloads/DsmSuite.DotNetAnalyzer.msi)        |
| Java analyzer          | Dependencies between Java classes                  | [download](https://dsmsuite.github.io/downloads/DsmSuite.JdepsAnalyzer.msi)         |
| C++ analyzer           | Dependencies between C++ source files              | [download](https://dsmsuite.github.io/downloads/DsmSuite.CppAnalyzer.msi)           |
| Visual Studio analyzer | Dependencies between VC++ source files or projects | [download](https://dsmsuite.github.io/downloads/DsmSuite.VisualStudioAnalyzer.msi)  |
| UML analyzer           | Dependencies between UML elements                  | [download](https://dsmsuite.github.io/downloads/DsmSuite.UmlAnalyzer.msi)               |
| Transformer            | Perform transformations on a DSI file              | [download](https://dsmsuite.github.io/downloads/DsmSuite.Transformer.msi)           |

The analyzer, transformer and builder are configured using a XML settings file, which is specified at the command line.

# Using the DSM Suite

The following steps are required to be able to view dependencies in the DSM viewer.

1. Analyze the code with a suitable analyzer. Export the result to a DSI file.
2. Optionally transform the model using the transformer. Export the result to a DSI file.
3. Build the DSM file.
4. Open the DSM file to show it in the viewer.

## Step 1: Perform dependency analysis

Follow the detailed instruction of the selected analyzer:

| Name                   | Instruction                                             |
|:-----------------------|:--------------------------------------------------------|
| .Net analyzer          | [Analyzing .Net code](user_guide_dotnet)                |
| Java analyzer          | [Analyzing Java code](user_guide_java)                  |
| C++ analyzer           | [Analyzing C/C++ code](user_guide_cpp)                  |
| Visual Studio analyzer | [Analyzing VC++ projects](user_guide_visual_studio)     |
| UML analyzer           | [Analyzing Sparx System EA UML models](user_guide_uml)  |

This step results in DSI file.

## Step 2: Optionally apply transformations

### Configure the transformer

The following settings are defined:

| Setting                | Description                                                           | 
|:-----------------------|:----------------------------------------------------------------------|
| LoggingEnabled         | Log information to file for diagnostic purposes.                      |
| InputFilename          | File name with .dsi extension used to extract dependency information. |     
| MergeHeader            | Move C/C++ header to implementation.                                  |  
| AddTransitiveRelations | Add transitive relations.                                             |     
| TransformationEnabled  | Transformation rules are enabled to transform the DSM.                |  
| TransformationRules    | Set of rules specifying transformation actions.                       | 
| OutputFilename         | File name with .dsi extension used to write transformed information.  |      

## Example

**TransformerSetting**

```xml
<?xml version="1.0" encoding="utf-8"?>
<TransformerSettings xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema">
  <LoggingEnabled>false</LoggingEnabled>
  <InputFilename>Input.dsi</InputFilename>
  <MergeHeader>false</MergeHeader>
  <TransformaationEnabled>true</TransformaationEnabled>
  <TransformationRules>
    <TransformationRule>
      <From>Header Files.</From>
      <To>Source Files.</To>
    </TransformationRule>
  </TransformationRules>
  <AddTransitiveRelations>true</AddTransitiveRelations>
  <OutputFilename>Output.dsi</OutputFilename>
</TransformerSettings>
```

### Run the transformer

C:\Program Files (x86)\DsmSuite\Transformer\DsmSuite.Transformer.exe TransformerSettings.xml

## Step 3: Running the DSM builder

### Configure the builder

The following settings are defined:

| Setting          | Description                                                          | 
|:-----------------|:---------------------------------------------------------------------|
| LoggingEnabled   | Log information to file for diagnostic purposes                      |
| InputFilename    | File name with .dsi extension used to extract dependency information |     
| OutputFilename   | File name with .dsm extension used to write DSM information          |      

## Example

**BuilderSettings.xml**

```xml
<?xml version="1.0" encoding="utf-8"?>
<BuilderSettings xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema">
  <LoggingEnabled>false</LoggingEnabled>
  <InputFilename>Input.dsi</InputFilename>
  <OutputFilename>Output.dsm</OutputFilename>
</BuilderSettings>
```

### Run the builder

C:\Program Files (x86)\DsmSuite\DsmViewer\DsmSuite.DsmBuilder.exe BuilderSettings.xml

### Step 4: Viewing and modifying the DSM

![DSM viewer](https://dsmsuite.github.io/assets/img/user_manual/dsm_viewer.png "DSM viewer")

*Figure 2: DSM Viewer*

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

