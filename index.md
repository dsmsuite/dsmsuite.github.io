---
layout: default
---


## The cost of software complexity

It is well known that software complexity has a large impact of software quality. 

A study by Dan Sturtevant has shown that architectural complexity is expensive.

Defect rate
- 3.1X increase between periphery and core
- 2.6X for McCabe, combined effect 8.3X

Lower productivity 
- 50% decline as developer moves from periphery to core (conservatively) 

Higher staff turnover 
- 10x increase in voluntary and involuntary terminations

> Metric plaatje
> for more info
> https://sdm.mit.edu/news/news_articles/webinar_050613/sturtevant_050613.pdf
> https://www.youtube.com/watch?v=tO4OinbOWaE

This study confirms the results from an earlier US Air Force study, which showed that well-structured software 
is delivered in half the time, at half the cost, with 8x less bugs. 

## Impact of Poor Software Dependencies

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

Robert martin

## Reasons we fail

Human
• Lack of awareness design principles
• Lack of training/coaching
• Project/human short term focus
• Consistent high project pressure will lead to accumulation of technical debt and will hurt productivity
Architecture Control
• Insufficient software architecture definition. In many cases architectural definition absent or provides insufficient guidance  (PowerPoint architecture).
• Insufficient software architecture control
• No validation if implementation conforms architectural definition
• Developers can easily violate intended architecture by modifying source code
Reasons – Architecture Visualization
• UML not suitable for managing software architecture
• Difficult to keep in synch with code
• Easily overwhelmed by dependencies
• Dependencies in model not in any view

## Using a design structure matrix

And although the impact of poor dependencies can the impact of cyclomatic complexity problems in this area often go undetected.
while modularity of cyclomatic complexity issues are easily visible from the IDE.

Due lack of visibility poor architecture poor from start of degrade over time.

Nunit plaatje

## Dependency Structure Matrix

• Consists of two parts
• Matrix to visualize dependencies 
• Algorithms which can be applied on the matrix
• Can be used to manage dependencies any kind of system which has
• A hierarchy of elements 
• Dependencies between elements
• Has been used for very complex systems

