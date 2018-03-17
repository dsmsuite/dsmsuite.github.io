---
layout: default
---

## Why software dependencies matter

Ideally, software can be easily modified, is understandable, reliable and reusable. 
In practice, this often remains an ideal and in the course of time the software becomes increasingly rigid, 
opaque and fragile. An example of the evolution of the JUnit architecture illustrates this:

![evolution of junit dependencies across releases](https://dsmsuite.github.io/assets/img/index/nunit.gif "evolution of junit dependencies across releases")

[source](http://edmundkirwan.com/general/junit.html)

### The cost of software complexity
A study by Dan Sturtevant has investigated the impact of software dependencies. It found that:

Defect rate
* A 3.1X increase between modules with many dependencies versus few dependencies
* A 2.6X increase between modules with high cyclomatic complexity versus low complexity
* A combined effect 8.3X

![Impact of dependencies vs cyclomatic complexity](https://dsmsuite.github.io/assets/img/index/cost_of_complexity.png "Impact of dependencies vs cyclomatic complexity")

Lower productivity 
- A 50% decline when developers works on modules with many dependencies versus few dependencies

Higher staff turnover 
- A 10x increase in voluntary and involuntary terminations for developers work on modules with many dependencies versus few dependencies

> For detailed information about this study see the [presentation]https://sdm.mit.edu/news/news_articles/webinar_050613/sturtevant_050613.pdf 
> or the [video]https://www.youtube.com/watch?v=tO4OinbOWaE.

This study confirms the results from an earlier US Air Force study, which showed that well-structured software 
is delivered in half the time, at half the cost, with 8x less bugs. 

### The impact of poor dependencies

* *Rigidity*: Software difficult to change, even in simple ways

* *Fragility*: Software often breaks in many places every time it is changed

* *Immobility*: Software can not be isolated, so not reused across projects

* *Viscosity*: * Design preserving design harder than the hacks

* *Insufficient Testability*: Can not unit test due to excessive dependencies

## Why we fail

Although the impact of poor dependencies is well known, many projects are struggling with it.
This can have one of the following reasons:

### Human
* Lack of training/coaching
* Project/human short term focus. Consistent high project pressure will lead to accumulation of technical debt and will hurt productivity

### Architecture Control
* Insufficient software architecture definition. In many cases architectural definition absent or is too high level to provide guidance.
* Insufficient software architecture control. No validation if implementation conforms architectural definition. Developers can easily violate intended architecture by modifying source code

### Architecture Visualization
* UML not suitable for managing software architecture
* Difficult to keep in synch with code
* Easily overwhelmed by dependencies
* Dependencies in model not in any view

![uml](https://dsmsuite.github.io/assets/img/index/uml.gif "uml")
	
## Design structure matrix

A design structure matrix consists of a matrix to visualize dependencies of hierarchically organized elements and a set of algorithms which can be applied on the matrix to sort the elements.
It can be used to manage dependencies any kind of system which has a hierarchy of elements and dependencies between elements and has been used for very complex systems.

![example dsm](https://dsmsuite.github.io/assets/img/index/dsm_example.png "example dsm")

A design structure matrix can be used to visualize the code architecture. It  and can help in gaining understanding it and support architectural refactoring. 

Using design strucure matix can help:
* Provide architecture definition a a level between a conceptual architecture and the actual code
* Verify if teh actual code architecture conform  to the conceptual architecture.

Whereas the problems with poor modularity and high cyclomatic can be easily spotted by the developer by simple looking at a source file, problematic dependencies often go undetected.
[back](./)

Text can be **bold**, _italic_, or ~~strikethrough~~.

[Link to another page](another-page).
[Link to about page](about).
[Link to dsm page](dsm_overview).
[Link to user guide page](user_guide).
[Link to intro page](introduction).

There should be whitespace between paragraphs.

There should be whitespace between paragraphs. We recommend including a README, or a file with information about your project.

# [](#header-1)Header 1

This is a normal paragraph following a header. GitHub is a code hosting platform for version control and collaboration. It lets you and others work together on projects from anywhere.

## [](#header-2)Header 2

> This is a blockquote following a header.
>
> When something is important enough, you do it even if the odds are not in your favor.

### [](#header-3)Header 3

```js
// Javascript code with syntax highlighting.
var fun = function lang(l) {
  dateformat.i18n = require('./lang/' + l)
  return true;
}
```

```ruby
# Ruby code with syntax highlighting
GitHubPages::Dependencies.gems.each do |gem, version|
  s.add_dependency(gem, "= #{version}")
end
```

#### [](#header-4)Header 4

*   This is an unordered list following a header.
*   This is an unordered list following a header.
*   This is an unordered list following a header.

##### [](#header-5)Header 5

1.  This is an ordered list following a header.
2.  This is an ordered list following a header.
3.  This is an ordered list following a header.

###### [](#header-6)Header 6

| head1        | head two          | three |
|:-------------|:------------------|:------|
| ok           | good swedish fish | nice  |
| out of stock | good and plenty   | nice  |
| ok           | good `oreos`      | hmm   |
| ok           | good `zoute` drop | yumm  |

### There's a horizontal rule below this.

* * *

### Here is an unordered list:

*   Item foo
*   Item bar
*   Item baz
*   Item zip

### And an ordered list:

1.  Item one
1.  Item two
1.  Item three
1.  Item four

### And a nested list:

- level 1 item
  - level 2 item
  - level 2 item
    - level 3 item
    - level 3 item
- level 1 item
  - level 2 item
  - level 2 item
  - level 2 item
- level 1 item
  - level 2 item
  - level 2 item
- level 1 item

### Small image

![](https://assets-cdn.github.com/images/icons/emoji/octocat.png)

### Large image

![](https://guides.github.com/activities/hello-world/branching.png)


### Definition lists can be used with HTML syntax.

<dl>
<dt>Name</dt>
<dd>Godzilla</dd>
<dt>Born</dt>
<dd>1952</dd>
<dt>Birthplace</dt>
<dd>Japan</dd>
<dt>Color</dt>
<dd>Green</dd>
</dl>

```
Long, single-line code blocks should not wrap. They should horizontally scroll if they are too long. This line should be long enough to demonstrate this.
```

```
The final element.
```
