---
layout: default
---

# Design Structure Matrix Overview

A design structure matrix (DSM) consists of two parts
* A matrix to visualize dependencies 
* Algorithms which can be applied on the matrix to discover e.g. layering in the software.

First the design of a small example software application is shown in UML.
Then step-by-step it is explained how using a DSM can help to understand and improve the design.

## Design in UML

![uml](https://dsmsuite.github.io/assets/img/dsm_overview/uml.png "uml")

The UML diagram above shows the design of a small example software application. 

It intentionally contains the a few design errors:
* A cyclical relation between A4 and A5.
* A relation from A3 to P3 against the expected layering.
* A relationship from P5 to D3 that skips a layer.
* An unused class A6 without incoming relationships.
* A class U2 with many in- and outgoing relationships. 

It is also important the the classes U1 to U3 have many incoming relationships, which obfuscates the entire UML diagram.
This illustrates that the widely used UML notation is not suitable for representation of large amounts of dependencies.
For that reason, UML diagrams often does not show all relationships, but only the most essential, 
making it an incomplete view of the model.
 
## Design in DSM

![dsm definition](https://dsmsuite.github.io/assets/img/dsm_overview/dsm_1_definition.png "dsm definition")

The figure above shows the same design in a DSM. 

A DSM consists of a matrix with the same elements in the rows and columns. 
The hierarchy of packages and classes is visible on the left. 
The relations between the elements are in the cells. 
That column 5 (P4) of row 16 (A2) is filled, for example, 
means that P4 is dependent on A2. 
This is in accordance with the UML diagram. 
The number in the cell represents the strength of the relationship and 
is usually the number of dependencies between the elements. 
he cells on the diagonal represent the relationship of an element with itself and are usually empty.

Although it takes some time to read the matrices, there are a number of important advantages over UML.
These key strengths are discussed below.

## Key strengths

### Key strength 1 - Concise

In a DSM, the hierarchy can also be folded in whole or in part. 
The relational strengths of the collapsed cells are simply combined. 
The matrix is then more compact, but in terms of content it is still correct.
Therefore a DSM is scalable. Because the hierarchy can be fully or partially collapsed, 
it is possible to display a system with thousands of classes. 
As a result, the DSM will become more compact, but will still remain correct in terms of content.

![dsm fully expanded](https://dsmsuite.github.io/assets/img/dsm_overview/dsm_2a_expanded.png "dsm fully expanded")

![dsm partly collapsed](https://dsmsuite.github.io/assets/img/dsm_overview/dsm_2b_partly_collapsed.png "dsm partly collapsed")

### Key strength 2 - Architectural Discovery

By applying a partitioning algorithm on the DSM, the layering of the software can de discovered.
Such an algorithm tries to reorder the DSM in such a way that as many relationships as possible
come under the diagonal. 
This shows that elements with many inbound relationships (providers) have shifted to the bottom, 
while the elements with many outgoing relationships (consumers) have increased. 
Relationships that set the algorithm above the diagonal are an indication of cyclical dependencies in the software. 
These are undesirable because the elements in question are not independent and demonstrably contain more errors.

![dsm strict layering](https://dsmsuite.github.io/assets/img/dsm_overview/dsm_3a_partioning_before.png "dsm strict layering")

![dsm relaxed layering](https://dsmsuite.github.io/assets/img/dsm_overview/dsm_3b_partioning_after.png "dsm relaxed layering")

The figure above shows that there are problems with the layering: 
* P5 in the presentation layer directly uses D3 from the data layer.
* A3 in the application layer uses P3 in the presentation layer, which is violates the expected layering. 

### Key strength 3 - Dependency pattern discovery

A DSM makes it easy to recognize dependency patterns. 

![dsm encapsulation pattern](https://dsmsuite.github.io/assets/img/dsm_overview/dsm_5a_encapsulation_pattern.png "dsm encapsulation pattern")

It can also be seen that A1 and A2 are the public interfaces and that A3, A4 and A5 
are internal elements of the application layer, because they are used outside (3) 
or only within this layer (4), and that A6 is an unused element. 
because it does not have any inbound relationship (5). 

![dsm bus pattern](https://dsmsuite.github.io/assets/img/dsm_overview/dsm_5b_bus_pattern.png "dsm bus pattern")

U1, U2 and U3 are elements that are used throughout the software (6). 

![dsm change propagator pattern](https://dsmsuite.github.io/assets/img/dsm_overview/dsm_5c_change_propagator_pattern.png "dsm change propagator pattern")

However, U2 is problematic, because in addition to incoming relationships it also has outgoing relationships (7).

### Key strength 4 - Assist in refactoring

A DSM can be used to improve the dependency structure. 
In the matrix we can move an element to another component or layer, 
combine it with other elements or split and 
then recalculate all dependencies to see if this yields a better dependency structure. 
Suppose, for example, that P3 in Figure 5 actually belongs in the application layer. 
Then that element can be moved there. 
After recalculating the dependencies it can be seen that the cyclical relationship 
between the presentation and application layer has disappeared. 
The advantages of such an impact analysis are particularly evident in improvement scenarios 
that take place at the architectural level and thus affect multiple components. 
Without the use of a DSM, such analyzes are unreliable, 
because the software designed and the actual software architecture often do not match.

No cohesion.

Cyclic dependencies between elements are undesirable and in most cases, because the make code difficult to understand and test.
It most cases refactoring is required to eliminate these cyclic dependencies.

![dsm cycles](https://dsmsuite.github.io/assets/img/dsm_overview/dsm_6a_cycles.png "dsm cycles")

Each type of cyclic dependency requires a specific type of refactoring

| Dependency type    | Description                                                 | Required refactoring       |
|:-------------------|:------------------------------------------------------------|:---------------------------|
| System Cycle       | Cycles between classes in same module                       | Introduce interface        |
| Intercomponent     | Cycle Cycles between classes in different modules           | Introduce interface        |
| Hierarchical Cycle | Classes involved in cycle or creating cycle between modules | Move class to other module |
 
In our example we had a relation from A3 to P3 against the expected layering. No suppose after inspecting the source code we
discover that P3 does not contain user interface but application code. Therefore we decided to move it from the presentation to the application layer.

![dsm refactoring before](https://dsmsuite.github.io/assets/img/dsm_overview/dsm_6b_refactoring_before.png "dsm refactoring before")

![dsm refactoring after](https://dsmsuite.github.io/assets/img/dsm_overview/dsm_6c_refactoring_after.png "dsm refactoring after")

We see that after moving the class the cylic dependency has disappeared.

> To perform refactoring by direct manipulation of the elements in the DSM you need the  commercial [Lattix  DSM tool](http://lattix.com/).
> These type of feature are not supported by the DSMSuite viewer. 

### Key strength 5 - Communication

Architecture elements and permissible relationships between these elements can be documented by means of a DSM. 
Such a definition makes the permissible dependencies explicit and fulfills a bridging function between the conceptual architecture and the code. By automatic validation of the dependency rules in the software building process and possibly IDE, degradation of the architecture can be prevented.

A DSM can be used to visualize the allowed dependencies and thereby formalize the software architecture.

![dsm dependency rules](https://dsmsuite.github.io/assets/img/dsm_overview/dsm_7_rules.png "dsm dependency rules")

## Application area 
DSMs are very effective in situations where a good understanding of the actual software dependencies is essential. 
This includes large functional expansions, outsourcing research, technology migration, improvement of testability and 
increasing reuse between product variants. 

Where a well-documented software architecture is missing, it can be mapped with a DSM analysis of the source code.

# More information

* **Design Structure Matrix Methods and Applications**: book by Steven D. Eppinger and Tyson R. Browning
![dsm book](https://dsmsuite.github.io/assets/img/dsm_overview/dsm_book.jpg "dsm book")

* **www.dsmweb.org**: General information on DSMs

* **List of supporting supportings DSM visualization**: See [dsm_tools](dsm_tools)












• 

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








 


 

A DSM also makes it easy to recognize dependency patterns.

## Tooling 
Although the approach is very effective, there are currently not many tools that support DSM visualization.
Unfortunately, the open source tools currently available offer insufficient support, 
which forces them to use commercial tools.
Availability of adequate open source tools would lower the threshold for deploying DSMs. 








[back](./)
