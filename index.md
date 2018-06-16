---
layout: default
---

# Why software dependencies matter

Ideally, software can be easily modified, is understandable, reliable and reusable. 
In practice, this often remains an ideal and over the course of time the software becomes increasingly rigid, 
opaque and fragile. The underlying cause is that the dependency structure of the software degrades over time.

![evolution of junit dependencies across releases](https://dsmsuite.github.io/assets/img/index/nunit.gif "evolution of junit dependencies across releases")

*Figure 1: The evolution of the dependency structure of JUnit*

# The cost of software complexity
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

*Figure 2: Defect rate*

**Lower productivity**
* 50% decline as developer moves from periphery to core (conservatively) 

**Higher staff turnover**
* 10x increase in voluntary and involuntary terminations as developer moves from periphery to core

> For detailed information about this study see this [presentation](https://dsmsuite.github.io/documents/sturtevant_050613.pdf) 
> or this [video](https://www.youtube.com/watch?v=tO4OinbOWaE).

This study confirms the results from an earlier US Air Force study, which showed that well-structured software 
is delivered in half the time, at half the cost, with 8x less bugs. 

> For detailed information about this study see this [document](https://dsmsuite.github.io/documents/mitre-architecture-report.pdf) 

# Why we fail

Although the impact of poor dependencies is well known, many projects are still struggling with it.
This can have one of the following reasons:

**Human**
* Consistent high project pressure will lead to accumulation of technical debt and will hurt productivity

**Architecture Control**
* In many cases an architectural definition is absent or is at a too high conceptual level to provide guidance on which dependencies are allowed. 
Also no validation is performed if the implementation conforms to the architectural definition. 
This is essential because developers can easily violate intended architecture by simply modifying the source code

**Architecture Visualization**
* UML is not suitable for managing software architecture, because it is difficult to keep the model in sync with code. One is also easily overwhelmed when showing all dependencies. For this reason dependencies are often ignored on a view making the view incomplete.
	
# Design structure matrix

A design structure matrix consists of a matrix to visualize dependencies of hierarchically organized elements and 
a set of algorithms which can be applied on the matrix to sort the elements in order to discover layering.
The technique has been used to visualize very complex systems. An example of a design structure matrix is shown below:

![example dsm](https://dsmsuite.github.io/assets/img/index/dsm_example.png "example dsm")
*Figure 3: Design structure matrix*

Using a design structure matrix to visualize the code architecture addresses some of the problems described above:
* It can be used to visualize very complex software systems without overwhelming the user.
* It can be used to validate that the source code conforms to the intended architecture.
* It can be easily kept in sync with the code.

Is a powerful technique for analyzing, improving, and managing software architecture and can be adopted at any stage of the project

> For more information on design structure matrix see the [DSM Overview](dsm_overview).
