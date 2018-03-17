---
layout: default
---

## Analyzing Java code

This Java analyzer reads a Jdeps .dot file to determine dependencies between Java classes.
The element hierarchy is based on namespaces.

> Run jdeps as shown in the example below:
> jdeps" -verbose:class -recursive -dotoutput D:\DsmAnalysis\Java d:\ArgoUml\argouml.jar 

## Pre requisites
* Java SDK 8 or higher which contains Jdeps must be installed .

## Settings

The following settings are defined:

| Setting           | Description                                                        | 
| ------------------|:-------------------------------------------------------------------|
| LoggingEnabled    | Log information to file for diagnostic purposes                    |
| JdepsDotInputFile | Filename of Jdeps .dot file used to extract dependency information |
| OutputFilename    | Filename with dsi extension to which results will be written       |     

