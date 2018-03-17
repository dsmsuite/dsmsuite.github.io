---
layout: default
---

## Analyzing .Net code

The .Net analyzer parses assemblies using Mono.Cecil to determine dependencies between .Net classes.
The element hierarchy is based on namespaces.

## Pre requisites
* None

## Settings

The following settings are defined:

| Setting           | Description                                                   | 
| ------------------|:--------------------------------------------------------------|
| LoggingEnabled    | Log information to file for diagnostic purposes               |
| AssemblyDirectory | Directory where assemblies to be analyzed can be found        |
| OutputFilename    | Filename with dsi extension to which results will be written  |

