---
layout: default
---

# Why software dependencies matter

Ideally, software can be easily modified, is understandable, reliable and reusable. 
In practice, this often remains an ideal and in the course of time the software becomes increasingly rigid, 
opaque and fragile. 

An animated view of the evolution of the design of JUnit illustrates this ([source](http://edmundkirwan.com/general/junit.html)):

![evolution of junit dependencies across releases](https://dsmsuite.github.io/assets/img/index/nunit.gif "evolution of junit dependencies across releases")

# The cost of software complexity
A study by Dan Sturtevant has investigated the impact of software dependencies. It classified modules into the following types 
peripheral (few dependencies), utility (many ingoing dependencies), control (many outgoing dependencies) and core (many in- and outgoing dependencies).

It found out that:

**Defect rate**
* 3.1X increase between periphery and core
* 2.6X for McCabe
* Combined effect 8.3X

![cost of complexity](https://dsmsuite.github.io/assets/img/index/cost_of_complexity.png "cost of complexity")

**Lower productivity**
* 50% decline as developer moves from periphery to core (conservatively) 

**Higher staff turnover**
* 10x increase in voluntary and involuntary terminations as developer moves from periphery to core

> For detailed information about this study see this [presentation](https://sdm.mit.edu/news/news_articles/webinar_050613/sturtevant_050613.pdf) 
> or this [video](https://www.youtube.com/watch?v=tO4OinbOWaE).

This study confirms the results from an earlier US Air Force study, which showed that well-structured software 
is delivered in half the time, at half the cost, with 8x less bugs. 

# Why we fail

Although the impact of poor dependencies is well known, many projects are still struggling with it.
This can have one of the following reasons:

**Human**
* Consistent high project pressure will lead to accumulation of technical debt and will hurt productivity

**Architecture Control**
* In many cases an architectural definition is absent or is too high conceptual level to provide guidance on which dependencies are allowed. Also no validation is performed if the implementation conforms to the 
architectural definition. 
This is essential because developers can easily violate intended architecture by simply modifying the source code

**Architecture Visualization**
* UML is not suitable for managing software architecture, because it is difficult to keep the model in synch with code. One is also easily overwhelmed when showing all dependencies. For this reason dependencies are often ignored on a view making the view incomplete.
	
# Design structure matrix

A design structure matrix consists of a matrix to visualize dependencies of hierarchically organized elements and a set of algorithms which can be applied on the matrix to sort the elements in order to discover layering.
The technique has been used to visualize very complex systems. An example of a design structure matrix is shown below:

![example dsm](https://dsmsuite.github.io/assets/img/index/dsm_example.png "example dsm")

Using a design structure matrix to visualize the code architecture addresses some of the problems described above:
* It can be used to visualize very complex software systems without overwhelming the user.
* It can provide detailed guidance by providing an architecture definition at a level between the conceptual architecture and the actual code.
* It can be used to validate that the actual code architecture conforms to the architecture.
* It can be easily kept in sync with the code.

Is a powerful technique for analyzing, improving, and managing complex system architectures and dependencies and can be adopted at any stage of the project

> For more information on design structure matrix see the [DSM Overview](dsm_overview).
