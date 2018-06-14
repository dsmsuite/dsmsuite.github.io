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

# History

The DSM suite is based on the source of the [DSM plugin for Visual Studio](https://github.com/tecsoft/dsm-vs-addin). 
This open source DSM implementation provided the best starting point for developing the DSM tool suite.

To achieve the goals above the following major modifications have been made:
* Converted it from a Visual Studio plug-in into a standalone application.
* Separated the C# code analyzer from the plug-in and converted it into command line code executable.
* Separated the building of the DSM model from the plug-in and converted it into command line executable.
* Added command line code analyzers for C++, Java, UML and Visual Studio.

I also did some cleanup of the code and used JetBrains Resharper to inspect and fix coding issues. 

# Source Code

See [github](https://github.com/dsmsuite) for the source code of the DSM tool suite.

# Contribute

Although I provided a solution for a few commonly used programming languages, I can not possibly provide them for all possible programming languages and environments. 

For this reason I have designed the tool suite in such a way that you can add your own code analyzer.
Although the DSM tool suite has been developed in C#, code analyzers can be developed in any language. The only requirement is that its output conforms to the XSD schema mentioned in the [user guide](user_guide).

I you have a code analyzer for a specific programming language or environment, please let me know, so I share this information on this web site.

Also let me know if you would like to contribute to the DSM tool suite development. 
