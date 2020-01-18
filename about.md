---
layout: default
---

Although using a DSM is a very effective approach for managing software dependencies, there are not many tools that support DSM visualization.
Existing open source DSM tools offer insufficient functionality and fully featured commercials tools are quite expensive. 

For details on tools supporting DSM see the [dsm tools](dsm_tools)

The aim of the DSM tool suite is to offer a free solution and thereby significantly lowering the  threshold for applying DSMs. 

# Goals

The goals of the DSM tool suite are:
* To provide a free open source tool suite for DSM visualization.
* To support a number of well known programming languages and environments.
* To allow for easy extension to support other programming languages and environments.
* To allow integration into a continuous integration build chain.

# Credits

The DSM suite was initially based on the source code of the [DSM plugin for Visual Studio](https://github.com/tecsoft/dsm-vs-addin) developed by Tom Carter. This open source DSM implementation provided the best starting point for developing the DSM tool suite.

# History

To achieve the goals above the following major modifications have been made:
* Converted it from a Visual Studio plug-in into a standalone application.
* Separated the C# code analyzer from the plug-in and converted it into command line code executable.
* Separated the building of the DSM model from the plug-in and converted it into command line executable.
* Added command line code analyzers for C++, Java, UML and Visual Studio.
Later in time almost the entire software has been rewritten from a Windows Forms application to a WPF application. 

# Source Code

See github for the source code of the DSM tool suite. There are two repositories:
* [dsmsuite.sourcecode](https://github.com/dsmsuite/dsmsuite.sourcecode): Repository containing the viewer, builder and analyzers
* [dsmsuite.github.io](https://github.com/dsmsuite/dsmsuite.github.io): Repository containing these documentation pages.

# Reporting defects and suggestions

If you find a defect or have a suggestion please subsmit a issue for the appropriate repository.

* [submit a documenation issue](https://github.com/dsmsuite/dsmsuite.github.io/issues)
* [submit a source code issue](https://github.com/dsmsuite/dsmsuite.sourcecode/issues)

# Contribute

Although I provided a solution for a few commonly used programming languages, I can not possibly provide them for all possible programming languages and environments. 

For this reason I have designed the DSM suite in such a way that you can add your own code analyzer.
Although the DSM suite has been developed in C#, code analyzers can be developed in any language. The only requirement is that its output conforms to the XSD schema mentioned in the [user guide](user_guide).

I you have a code analyzer for a specific programming language or environment, please let me know, so I share this information on these pages.

Also let me know if you would like to contribute to the DSM tool suite development. 
