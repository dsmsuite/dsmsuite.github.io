---
layout: default
---

# Technical Overview

The DSM suite consists of the following components:

![Technical Overview](https://dsmsuite.github.io/assets/img/user_manual/technical_overview.png "Technical Overview")

*Figure 9: DSM Suite Key Components*

## Analyzer
An analyzer, which extracts information on elements and their relations from source, binaries or other data. An analyzer exports this information to a DSI file.

A few standard analyzers are provided. If none of the provided analyzers suites your needs, 
it is possible to write your own analyzer as long as its writes the result to a DSI file.

> The DSI file must conform to the XSD schema described below. The DSM file format can be changed without any notice. 

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

## Logging

The tooling supports the following log levels:

| Log Level      | Description                                          |
|:---------------|:-----------------------------------------------------|
| None           | Nothing is logged                                    |
| User           | User messages are logged to a file                   |
| Warning        | Warnings messages are logged to a file               |
| Error          | Errors messages are logged to a file                 |
| Info           | Info message are logged to a file                    |
| Data           | Data model actions are logged to a file              |
| All            | Detailed information is logged to  file              |

Standard the following log file can be generated:

| Log Level      | Log file                          | Description                                                                          | 
|:---------------|:----------------------------------|:-------------------------------------------------------------------------------------|
| User           | userMessages.log                  | Contains all messages as shown in the console.                                       |
| Error          | errorMessages.log                 | Contains error messages.                                                             |
| Error          | exceptions.log                    | Contains information about any exceptions that occured during the analysis.          |
| Warning        | warningMessages.log               | Contains warnings messages.                                                          |
| User           | infoMessages.log                  | Contains information messages.                                                       |
| Data           | dataModelActions.log              | Contains all actions on the data model like load, save and registration.             |
|                | dataModelRelationsNotResolved.log | Contains queried relations that could not be resolved.                               | 

Notes:
* Each log level also includes logging of all previous log levels.
* Exceptions and user message are always written to the console independent of the selected log level.
* For each level an analyzer may add additional log files. If so details can be found in the documentation for that analyzer.

## File compression

Both .dsi and .dsm files can be written as a compressed file or as plain xml. Compression can be used to reduce file size.
Upon reading the tooling automatically detects if a file is compressed, so separate extension is used for the compressed format.
The used compression is the zip format.

# DSM Viewer Features

The viewer has the following features:

## Model navigation
The tool will have the element hierarchy and dependencies between the elements. The hovered and selected element or dependency are highlighted.

![Model navigation](https://dsmsuite.github.io/assets/img/features/model_navigation.png "Model navigation")

*Figure 1: Model navigation*

## Dependency visualization
It will show the dependency strength in the matrix.  Cycles will be highlighted. Consumers and providers of the selected element are highlighted as well.

![Dependency visualization](https://dsmsuite.github.io/assets/img/features/dependency_visualization.png "Dependency visualization")

*Figure 2: Dependency visualization*

## Metrics
It has a  metrics view which can be expanded and will show metrics per element.

![Metrics](https://dsmsuite.github.io/assets/img/features/metrics.png "Metrics")

*Figure 3: Metrics*

## Element search
It allows searching for elemets by name or part of the name. The number of found elements is indicated. In the matrix elements containing the found elements are highlighted so it is easy to navigate to the found elements.
![Element search](https://dsmsuite.github.io/assets/img/features/search.png "Element search")

*Figure 5: Element search*

## Zoom and screenshot
A screenshot can be taken and the zoomlevel can be adjusted.

A jus can be taken and the zoom level can be ad
![Zoom and screenshot](https://dsmsuite.github.io/assets/img/features/zoom_and_screenshot.png "Zoom and screenshot")

*Figure 5: Zoom and screenshot*

## Queries
A list of consumers and providers can be shown for an element.

![Queries](https://dsmsuite.github.io/assets/img/features/queries.png "Queries")

*Figure 6: Queries*

## Detail matrix
A detailed matrix can be show for s selected element or dependency.

![Detail matrix](https://dsmsuite.github.io/assets/img/features/detail_matrix.png "Detail matrix")

*Figure 7: Detail matrix*

## Model editing
Models can be editing by:
	* Move elements up or down
	* Create, edit, and delete elements
	* Create, edit, and delete relations
	* Partition a section of the DSM model
	* Saving the changes in the DSM file
	
![Model editing](https://dsmsuite.github.io/assets/img/features/editing.png "Model editing")

*Figure 8: Model editing*

# The DSI file format

Each analyzer must export its results to DSI file. To ensure that the DSM builder can import this file,
it must conform the DSI file XSD schema below:

![DSI XSD Schema](https://dsmsuite.github.io/assets/img/user_manual/xsd_schema.png "DSI XSD Schema")

```xml
<xs:schema xmlns:xs="http://www.w3.org/2001/XMLSchema" elementFormDefault="qualified" attributeFormDefault="unqualified">
  <xs:element name="system">
    <xs:complexType>
      <xs:sequence>
        <xs:element name="metadatagroup">
          <xs:complexType>
            <xs:sequence>
              <xs:element name="metadata" maxOccurs="unbounded">
                <xs:complexType>
                  <xs:attribute name="name" type="xs:string"></xs:attribute>
                  <xs:attribute name="value" type="xs:int"></xs:attribute>
                </xs:complexType>
              </xs:element>
            </xs:sequence>
            <xs:attribute name="name" type="xs:string"></xs:attribute>
          </xs:complexType>
        </xs:element>
        <xs:element name="elements">
          <xs:complexType>
            <xs:sequence>
              <xs:element name="element" maxOccurs="unbounded">
                <xs:complexType>
                  <xs:attribute name="id" type="xs:int"></xs:attribute>
                  <xs:attribute name="name" type="xs:string"></xs:attribute>
                  <xs:attribute name="type" type="xs:string"></xs:attribute>
                  <xs:attribute name="annotation" type="xs:string"></xs:attribute>
                </xs:complexType>
              </xs:element>
            </xs:sequence>
          </xs:complexType>
        </xs:element>
        <xs:element name="relations">
          <xs:complexType>
            <xs:sequence>
              <xs:element name="relation" maxOccurs="unbounded">
                <xs:complexType>
                  <xs:attribute name="from" type="xs:int"></xs:attribute>
                  <xs:attribute name="to" type="xs:int"></xs:attribute>
                  <xs:attribute name="type" type="xs:string"></xs:attribute>
                  <xs:attribute name="weight" type="xs:int"></xs:attribute>
                </xs:complexType>
              </xs:element>
            </xs:sequence>
          </xs:complexType>
        </xs:element>
      </xs:sequence>
      <xs:attribute name="xmlns" type="xs:string"></xs:attribute>
    </xs:complexType>
  </xs:element>
</xs:schema>
```

[download XSD](https://dsmsuite.github.io/downloads/dsi.xsd "XSD Schema")

Each element has the following properties:

| Name          | Description                                                   |
|:--------------|:--------------------------------------------------------------|
| id            | An unique integer value defining the element.                     |
| name          | An unique name of the element. The name consists of dot separated elements. Each element represents a part in a element hierarchy e.g. a directory or a namespace.               |
| type          | The type of element e.g. class, enum of file.                 |
| annotation    | Additional information about the element.             |

Each relation has the following properties:

| Name                   | Description                                          |
|:-----------------------|:-----------------------------------------------------|
| from                   | The id of the provider element.                      |
| to                     | The id of the consumer element.                      |
| type                   | The type of relation e.g. include, inherit, realize. |
| weight                 | The strength of the relation.                        |

# Installation

Download the installer and install whatever best suits your needs.

See [downloads](downloads)

# Analyzing Code

The following steps are required to be able to analyze code dependencies.

1. Analyze the code with a suitable analyzer, which export the result to a DSI file.
2. Build the DSM file. 
3. Open the DSM file in the viewer.

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

## Step 2: Running the DSM builder

### Configure the builder

The following settings are defined:

| Setting                                    | Description                                                                | 
|:-------------------------------------------|:---------------------------------------------------------------------------|
| LogLevel                                   | Log level as described above                                               |
| Input.Filename                             | File name with .dsi extension used to extract dependency information       |     
| Transformation.ApplyPartitioningAlgorithm  | Automatically apply partitioning algorithm on the model to sort it         |
| Output.Filename                            | File name with .dsm extension used to write DSM information                |  
| Output.Compress                            | Compress output file                                                       |

## Example

**BuilderSettings.xml**

```xml
<?xml version="1.0" encoding="utf-8"?>
<BuilderSettings xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
  <LogLevel>Detailed</LogLevel>
  <Input>
    <Filename>SampleModel.dsi</Filename>
  </Input>
  <Transformation>
    <ApplyPartitioningAlgorithm>false</ApplyPartitioningAlgorithm>
  </Transformation>
  <Output>
    <Filename>SampleModel.dsm</Filename>
    <Compress>true</Compress>
  </Output>
</BuilderSettings>
```

### Run the builder

C:\Program Files\DsmSuite\DsmViewer\DsmSuite.DsmBuilder.exe BuilderSettings.xml






