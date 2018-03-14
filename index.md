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

This study confirms the results from an earlier US Air Force study, which showed that well-structured software 
is delivered in half the time, at half the cost, with 8x less bugs. 

> For information see [presentation]: https://sdm.mit.edu/news/news_articles/webinar_050613/sturtevant_050613.pdf 
> or[video]: https://www.youtube.com/watch?v=tO4OinbOWaE.

And although the impact of poor dependencies can the impact of cyclomatic complexity problems in this area often go undetected.
while modularity of cyclomatic complexity issues are easily visible from the IDE.

[logo]: https://dsmsuite.github.io/assets/img/CostOfComplexity.png "Logo Title Text 2"

Due lack of visibility poor architecture poor from start of degrade over time.

[logo]: https://dsmsuite.github.io/assets/img/nunit.gif "Logo Title Text 2"

Source http://edmundkirwan.com/general/junit.html 

## Your code as model

Using design structure matrix increase visibility of the actual code architecture and help in 
gaining understanding it and support architectural refactoring.

A design structure matrix:

* Consists of two parts
	* Matrix to visualize dependencies 
	* Algorithms which can be applied on the matrix
* Can be used to manage dependencies any kind of system which has
	* A hierarchy of elements 
	* Dependencies between elements
• Has been used for very complex systems


