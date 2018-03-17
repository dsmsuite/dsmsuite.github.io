---
layout: default
---

Although the DSM approach is a very effective for managing software dependencies, there are not many tools that support DSM visualization.
Existing open source DSM tools offer insufficient functionality and fully featured commercials tools are quite expensive. 

The aim of the DSM tool suite is to offer a free solution and thereby lowering the threshold for applying DSMs. 

## DSM tool suite goals

The goals of the DSM suite are:
* To provide an free open source tool suite for DSM visualization.
* To support a number of well known programming languages and environments.
* To allow for easy extension to support new programming languages and environments.
* To allow integration into a continuous integration build chain.

See https://github.com/dsmsuite for the source code of the DSM suite.

## History

The DSM suite is based on the source of the DSM plugin for Visual Studio as can be 
found at https://github.com/tecsoft/dsm-vs-addin. 

To achieve the goals above the following major modifications have been made:
* Converted it from a plug-in into a standalone application.
* Separated the C# code analyzer from the plug-in and converted it into command line code executable.
* Separated the building of the DSM model from the plug-in and converted it into command line executable.
* Added command line code analyzers for C++, Java, UML and Visual Studio.

I also did some cleanup of the code and used resharper to inspect and fix coding issues. 

[back](./)
