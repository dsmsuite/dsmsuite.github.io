---
layout: default
---

# Aspects of good software design

The following are some aspects which are important for good software design:

| Aspect     | Guideline                                                                      | Metric                     | Visibility |                                                                                |
|:-----------|--------------------------------------------------------------------------------|:---------------------------|:-----------|
| Naming     | Names should reflect problem domain.                                           | None                       | High       |
| Complexity | Methods should have a low cyclomatic complexity.                               | <10                        | High       |
| Cohesion   | Modules should be small and follow the single responsibility principle.        | <1KLOC                     | High       |
| Coupling   | Low coupling and dependencies towards abstractions and interfaces. No cycles.  | None                       | Low        |

All these aspects except coupling can be easily observed from the source code using an IDE or editor. 
The impact of the lack of visibility for coupling is that problems with software dependencies often go undetected.

# Why software dependencies matter

Ideally, software can be easily modified, is understandable, reliable and reusable. 
In practice, this often remains an ideal and over the course of time the software becomes increasingly rigid, 
opaque and fragile. In many cases the underlying cause is that the dependency structure of the software degrades over time.

![evolution of junit dependencies across releases](https://dsmsuite.github.io/assets/img/index/nunit.gif "evolution of junit dependencies across releases")

*Figure 1: The evolution of the dependency structure of JUnit*

A study by Dan Sturtevant investigated the impact of software dependencies on defect rate, productivity and staff turnover. It classified modules into the following types:
* Peripheral: Few dependencies
* Utility: Many ingoing dependencies
* Control: Many outgoing dependencies
* Core : Many in- and outgoing dependencies

The outcome of the study was that software dependencies have the following impact:

**Defect rate**
* 3.1X increase between periphery and core
* 2.6X for McCabe
* Combined effect 8.3X

![cost of complexity](https://dsmsuite.github.io/assets/img/index/cost_of_complexity.png "cost of complexity")

*Figure 2: Complexity versus defect rate*

**Lower productivity**
* 50% decline as developer moves from periphery to core (conservatively) 

**Higher staff turnover**
* 10x increase in voluntary and involuntary terminations as developer moves from periphery to core

> For detailed information about this study see this [presentation](https://dsmsuite.github.io/documents/sturtevant_050613.pdf) 
> or this [video](https://www.youtube.com/watch?v=tO4OinbOWaE).

This study confirms the results from an earlier US Air Force study, which showed that well-structured software 
is delivered in half the time, at half the cost, with 8x less bugs. 

> For detailed information about this study see this [document](https://dsmsuite.github.io/documents/mitre-architecture-report.pdf) 

# Why software dependency management is hard

Although the impact of poor dependencies is well known, many software projects are struggling with it.
This can have one of the following reasons:

**Human**
* Consistent high project pressure will lead to accumulation of technical debt and will hurt productivity.

**Architecture Control**
* An architectural definition is absent or is at a too high conceptual level to provide guidance on which dependencies are allowed. 
* No validation is performed if the implementation conforms to the architectural definition. This is essential because developers can easily violate intended architecture by simply modifying the source code. 

**Architecture Visualization**
* The commonly used UML notation is not suitable for managing software architecture, because when showing all actual dependencies using the UML notation one is also easily overwhelmed. It is also difficult to keep the model in sync with code. 
	
# Design structure matrix

A design structure matrix consists of a matrix to visualize dependencies of hierarchically organized elements and 
a set of algorithms which can be applied on the matrix to sort the elements in order to discover layering.

An example of a design structure matrix is shown below:

![example dsm](https://dsmsuite.github.io/assets/img/index/dsm_example.png "example dsm")
*Figure 3: Design structure matrix*

# Application Area

Some common usage scenarios for DSM visualization of the code architecture are:
* Reduce defects
  * By helping to reduce complex software dependencies.
  * By improving the understanding the system and the implications of change. See the conclusion of chapter 25 'Where Do Most Software Flaws Come From?' from the book ‘Making Software’. See [oreilly](https://www.oreilly.com/library/view/making-software/9780596808310/),
* Reduce learning time for unfamiliar code bases:
  * By allowing you to get a high level overview of a code base.
* Asses software architecture:
  * Discovery of software architecture of undocumented software. 
  * Checking if it is in line with the documented architecture.
  * Discovery of emergent architecture. See [Scaled Agile](https://www.scaledagileframework.com/agile-architecture/) on intentional versus emergent architecture.
* Impact analysis of architecture refactoring:
  * Align implemented architecture with intended architecture.
  * Isolate parts of the software, so they can be outsourced.
  * Encapsulate third party software, so it can be easily replaced.
  * Separating critical software from non critical software, so only critical parts need to be developed using more formal processes e.g. in health domain.

# Advantages
DSM visualization is a technique for analysing, improving, and managing complex system architectures.

* Powerful technique 
  * Scales better than boxes and lines diagram.
  * Highlighting dependency cycles is a key strength.
  * Partitioning algorithms provide mechanism for architectural discovery in large code base.
  * It can be easily kept in sync with the code.
  
* Proven technique 
  * Has been used successfully in a wide variety of projects in many industries.
  * Can be adopted at any stage of the project.
  * Enforce architecture: Check if implemented software architecture conforms to defined one. 
  * Architectural Discovery: Identify structure existing code base. 
  * Re-engineer/refactor: Impact analysis of architectural refactoring scenarios prior to implementation.

* Can be applied at multiple levels
  * Architecture, Component and Class

> For more information on design structure matrix see the [DSM Overview](dsm_overview).
