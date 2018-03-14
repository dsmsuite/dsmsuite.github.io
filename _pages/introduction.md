---
layout: page
title: Introduction title
subtitle: Introduction subtitle
desc: Introduction description
permalink: /introduction/
---

Design Structure Matrix - Your code as model

# Why dependencies matter
Ideally, software can be easily modified, is understandable, reliable and reusable. 
In practice, this often remains an ideal and in the course of time the software becomes increasingly rigid, 
opaque and fragile.

Nunit plaatje

Many projects however suffer for the following issues caused by poor software dependencies:

Rigidity
* Software difficult to change, even in simple ways

Fragility
* Software often breaks in many places every time it is changed

Immobility
* Software can not be isolated, so not reused across projects

Viscosity
* Design preserving design harder than the hacks

Insufficient Testability
* Can not unit test due to excessive dependencies

# Why we fail

Reasons - Human
• Lack of awareness design principles
• Lack of training/coaching
• Project/human short term focus
• Consistent high project pressure will lead to accumulation of technical debt and will hurt productivity
Reasons – Architecture Control
• Insufficient software architecture definition
• In many cases architectural definition absent or provides insufficient guidance 
• PowerPoint architecture
• Insufficient software architecture control
• No validation if implementation conforms architectural definition
• Developers can easily violate intended architecture
• By modifying source code
Reasons – Architecture Visualization
• UML not suitable for managing software architecture
• Difficult to keep in synch with code
• Easily overwhelmed by dependencies
• Dependencies in model not in any view


# Dependency Structure Matrix

• Consists of two parts
• Matrix to visualize dependencies 
• Algorithms which can be applied on the matrix
• Can be used to manage dependencies any kind of system which has
• A hierarchy of elements 
• Dependencies between elements
• Has been used for very complex systems

#Example in UML

# Key strengths

# Communication

# Concise

# Discover dependency patterns

# Layering

# Interfaces

# Support refactoring

# Metrics

# How define architecture

Conceptual
Detail

# How does it fit in development cycle

# Common Use Cases
Discover the Architecture and Identify Issues with Interdependencies 
DSM Analysis
Specify/Enforce Architectures
Layers, Components, Interfaces with Dependency Rules 
Track, Measure and Report on Changes and Trends
Metrics
Re-engineer/Refactor 
Impact Analysis 




• Find actual layering by partitioning algorithms
• Algorithm tries to get as much as possible dependencies below identity line

• Found actual layering after applying partitioning algorithm

• Discover type of layering - Strict

• Discover type of layering - Relaxed

• Discover public, internal and unused code

• Discover utility modules used in entire software

• Discover modules with large change impact

• System Cycle 
• Cycles between classes in same module
• Intercomponent Cycle
• Cycles between classes in different modules
• Hierarchical Cycle
• Classes involved in cycle or creating cycle between modules

• Fix hierarchical cycle by moving element

• Result

• Can be used to visualize desired architecture.
• Can be encoded using rules.

• Discover the Architecture and Identify Issues with Interdependencies 
• DSM Analysis
• Specify/Enforce Architectures
• Layers, Components, Interfaces with Dependency Rules 
• Track, Measure and Report on Changes and Trends
• Metrics
• Re-engineer/Refactor 
• Impact Analysis 

• Lattix DSM Tool (commercial)
www.lattix.com
• Intelij IDEA Ultimate Java IDE (commercial)
https://www.jetbrains.com/idea/
• CppDepend/NDepend/JArchitect (commercial)
https://www.cppdepend.com/
https://www.ndepend.com/
https://www.jarchitect.com/
• Visual Studio DSM plug-in .NET (open source)
http://www.tom-carter.net/
• VC++ solution importer for plugin above





Summary

• Is a powerful technique for analyzing, improving, and managing complex system architectures and dependencies
• Can be adopted at any stage of the project

• Design Structure Matrix Methods and Applications
• Steven D. Eppinger and Tyson R. Browning





• www.dsmweb.org
• General information on DSMs
• Achieving Agility Through Architecture Visibility 
• Carl Hinsman, Neeraj Sangal and Judith Stafford




Demo



This document show
Ideally, software can be easily modified, understandable, reliable and reusable. 
In practice, this often remains an ideal and in the course of time the software becomes increasingly rigid, 
opaque and fragile. 

Nunit plaatje

This makes adjustments more and more difficult to implement. 
Also, components are difficult to isolate and therefore not reusable and individually testable. 
All these problems are caused by software dependencies.
Many software projects struggle with software dependencies. 
 

Also, the widely used UML notation is not suitable for representation of large amounts of dependencies.


 
Elements with many incoming and outgoing relationships make a UML diagram unclear.

As an example, Figure 1 shows a UML class diagram with a number of typical situations. For example, there is a cyclical relationship between A4 and A5, a relation from A3 to P3 against the desired layering, a relationship from P5 to D3 that skips a layer and an unused class A6 without incoming relationships.Furthermore, U1 and U3 have many incoming relationships and U2 has many in- and outgoing relationships. These relationships in particular make the whole very unclear. For that reason, a UML diagram often does not show all relationships, but only the most essential, making it an incomplete view of the model.
Important benefits 
With the help of a Design Structure Matrix (DSM), a structure can be created for every system that has a hierarchy of elements and the relationships between these elements are also shown. Algorithms to analyze and rearrange the structure are an essential part of this method. Although originally conceived for process optimization, DSMs are also applicable for the visualization and analysis of product architectures. That makes it very suitable for software.
 
Where display of all relationships in a UML diagram can be unclear, this is not a problem at all in a DSM.
Figure 2 shows the design from Figure 1 again in a DSM. It consists of a matrix with the same elements in the rows and columns. The hierarchy of packages and classes is visible on the left. The relations between the elements are in the cells. That column 5 (P4) of row 16 (A2) is filled, for example, means that P4 is dependent on A2. This is in accordance with the UML diagram of Figure 1. The number in the cell represents the strength of the relationship and is usually the number of dependencies between the elements. The cells on the diagonal represent the relationship of an element with itself and are usually empty.
Although it takes some time to read the matrices, there are a number of important advantages over UML.First, a DSM can contain all relationships in a single view. Where representation of all relationships in a UML diagram can be unclear, as in Figure 1, this does not pose any problem in a DSM, as can be seen in the first three rows and columns of Figure 2.
 
In a DSM, the hierarchy can also be folded in whole or in part. The matrix is then more compact, but in terms of content it is still correct.
Secondly, a DSM is scalable. Because the hierarchy is fully or partially collapsible, it is possible to display a system with thousands of classes. If we collapse the DSM completely in Figure 2, we get the matrix in Figure 3. The relational strengths of the collapsed cells are simply combined. As a result, the DSM will become more compact, but will still remain correct in terms of content.
 
By applying a partitioning algorithm, the layering of the software can easily be made transparent in a DSM.
Thirdly, we can easily explain the layering of the software by applying a partitioning algorithm. Such an algorithm tries to reorder the DSM in such a way that as many relationships as possible come under the diagonal. Application to Figure 3 provides the matrix that is shown in Figure 4. This shows that elements with many inbound relationships (providers) have shifted to the bottom, while the elements with many outgoing relationships (consumers) have increased. Relationships that set the algorithm above the diagonal are an indication of cyclical dependencies in the software. These are undesirable because the elements in question are not independent and demonstrably contain more errors.
 
A DSM also makes it easy to recognize dependency patterns.
Fourth, a DSM makes it easy to recognize dependency patterns. Figure 5 shows that there are problems with the layering, because P5 in the presentation layer directly uses D3 from the data layer (1) and there is a dependency in undesired direction, because A3 in the application layer uses P3 in the presentation layer (2). It can also be seen that A1 and A2 are the public interfaces and that A3, A4 and A5 are internal elements of the application layer, because they are used outside (3) or only within this layer (4), and that A6 is an unused element. because it does not have any inbound relationship (5). U1, U2 and U3 are elements that are used throughout the software (6). However, U2 is problematic, because in addition to incoming relationships it also has outgoing relationships (7).
Finally, a DSM can be used to improve the dependency structure. In the matrix we can move an element to another component or layer, combine it with other elements or split and then recalculate all dependencies to see if this yields a better dependency structure. Suppose, for example, that P3 in Figure 5 actually belongs in the application layer. Then that element can be moved there. After recalculating the dependencies it can be seen that the cyclical relationship between the presentation and application layer has disappeared. The advantages of such an impact analysis are particularly evident in improvement scenarios that take place at the architectural level and thus affect multiple components. Without the use of a DSM, such analyzes are unreliable, because the software designed and the actual software architecture often do not match.
Application area 
DSMs are very effective in situations where a good understanding of the actual software dependencies is essential. This includes large functional expansions, outsourcing research, technology migration, improvement of testability and increasing reuse between product variants. Where a well-documented software architecture is missing, it can be mapped with a DSM analysis of the source code.
Architecture elements and permissible relationships between these elements can be documented by means of a DSM. Such a definition makes the permissible dependencies explicit and fulfills a bridging function between the conceptual architecture and the code. By automatic validation of the dependency rules in the software building process and possibly IDE, degradation of the architecture can be prevented.

## Tooling 
Although the approach is very effective, there are currently not many tools that support DSM visualization.
Unfortunately, the open source tools currently available offer insufficient support, 
which forces them to use commercial tools.
Availability of adequate open source tools would lower the threshold for deploying DSMs. 


If the deployment is limited to architectural analysis and monitoring, 
JArchitect offers sufficient features. 
If architecture refactoring is necessary, 
then Lattix is the best choice. Structure101 also supports architectural refactoring, 
but not through a DSM. In addition, 
Structure101 lacks the ability to visualize dependencies through a hierarchical matrix, 
which is essential. 
The Intelij Ultimate IDE offers limited DSM functionality as standard.


	                                        | Lattix	   | Structure101 | Intelij  | JArchitect   | SonarCube	 | DsmSuite
                                            |              |              | Ultimate | CppDepend    |            |
                                            |              |              |          | NDepend      |		     |	
-----------------------------------------------------------------------------------------------------------------------------											
Application type                            | Software     | Software     |Java IDE  | Software     | Continuous | Software
                                            | architecture | architecture |		     | architecture | inspection | architecture 	
                                            | analysis and | analysis and |          | and code     |            | analysis
											| refactoring  | refactoring  |          | analysis     |            |
-----------------------------------------------------------------------------------------------------------------------------											
Visualization dependencies                  |              |              |          |              |            |
Hierarchical matrix	                        | Yes	       | No	          | Yes	     | Yes          | No	     | No
Cyclic dependencies	                        | Yes          | Yes	Yes	Yes	Yes	Yes
Indirect dependencies	                    | No	No	No	Yes	No	No
Dependencies up to method / attribute level	| Yes	Yes	No	Yes	No	No
-----------------------------------------------------------------------------------------------------------------------------											

Architecture analysis and assessment        |
Number of partitioning algorithms           |	11	1	1	1	1	1
Number of software metrics	                |24	2	0	82	64	0
-----------------------------------------------------------------------------------------------------------------------------											

Impact analysis	                            | Yes	No	No	Yes	No	No
Architecture improvement
Simulate refactoring	                    | via DSM	via LSM	No	No	No	No
Definition dependency rules	                | yes	No	via code query language	No	N / A	No
IDE integration	Eclipse	Eclipse / Intelij	| N / A	No	N / A	No
Build integration	                        | Yes	Yes	No	Yes	Yes	No
Metrics trends	                            |Yes	Yes	Newe	Yes	Yes	No
remaining
Adaptability	                            | via Groovy	No	No	via code query language	No	No
Open source license	                        | No	No	No	No	Yes	Yes



