---
layout: page
title: About
subtitle: About subtitle
desc: About description
permalink: /about/
---

These page describe the advantages of using a design structure matrix to visualize complex software dependencies.
It also explains how this visualization method can be applied using the open source DSM suite. 
See https://github.com/dsmsuite for the source code of the DSM suite.

## Goals
Although the approach is very effective, there are currently not many tools that support DSM visualization.
Unfortunately, the open source tools currently available offer insufficient support, 
which forces them to use commercial tools.
Availability of adequate open source tools would lower the threshold for deploying DSMs. 

The goals of the DSM suite are:
-To provide an open source DSM visualization tool.
-To support a number of well known programming languages and environments.
-To allow for easy extension to support new programming languages and environments.
-To allow integration into continuous integration build chain.

## History

The DSM suite is based on the source of the DSM plugin for Visual Studio as can be 
found at https://github.com/tecsoft/dsm-vs-addin.

To achieve the goals above the following major modifications have been made:
-Converted it from a plug-in into a standalone application.
-Separated the C# code analyzer from the plug-in and converted it into command line executable.
-Separated the building of the DSM model from the plug-in and converted it into command line executable.
-Added command line code analyzers for C++, Java, UML and Visual Studio.

I also did some cleanup of the code and used resharper to fix coding issues. 