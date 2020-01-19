---
layout: default
---

# Tools supporting DSM visualization

# Overview of tools

| Tool		                                                | Purpose                                    | Type        |
|:----------------------------------------------------------|:-------------------------------------------|:------------|
| [Lattix DSM Tool](http://lattix.com/)                     | Software architecture analysis/refactoring | commercial  | 
| [Intelij IDEA Ultimate](https://www.jetbrains.com/idea/)  | Java IDE                                   | commercial  | 
| [CppDepend](https://www.cppdepend.com/)                   | Software architecture/code analysis        | commercial  | 
| [NDepend](https://www.ndepend.com/)                       | Software architecture/code analysis        | commercial  | 
| [JArchitect](https://www.jarchitect.com/)                 | Software architecture/code analysis        | commercial  | 
| [DSMSuite](https://dsmsuite.github.io/)                   | Software architecture analysis             | open source | 

> The tools CppDepend, Ndepend and JArchitect are identical, but support different programming languages. They will be listed below a XDepend

> The DSMSuite is based on the DSM plugin. Because it extends the features of the DSM plugin, this DSM plugin is not included in the table comparison below.

> Other well known tools for architecture analysis and refactoring are [Structure101](http://structure101.com/) 
> and [SonarSource](https://www.sonarsource.com/). Both however do not support DSM visualization. 
> The continuous inspection tool [sonarqube](https://www.sonarqube.org/) used to support DSM visualization, but this feature was dropped. 

# Feature overview


|	                                          | Lattix | Intelij  | XDepend    | DsmSuite  |
|:--------------------------------------------|:-------|:---------|:-----------|:----------|
| **Visualization dependencies**              |        |          |            |           |           
| Hierarchical matrix	                      | Yes	   | Yes	  | Yes        | Yes	   |  
| Cyclic dependencies	                      | Yes    | Yes	  | Yes	       | Yes       |
| Indirect dependencies	                      | No	   | No	      | Yes	       | Yes       |	
| Dependencies up to method / attribute level | Yes	   | No	      | Yes	       | No        |	
| **Architecture analysis and assessment**    |        |          |            |           |
| Number of partitioning algorithms           | 11	   | 1	      | 1	       | 2         |
| Number of software metrics	              | 24	   | 0	      | 82	       | 0         |
| **Architecture control**                    |        |          |            |           |
| Simulate refactoring	                      | Yes    | No       | No	       | Yes       |
| Definition dependency rules	              | Yes	   | no       | Yes        | No        |
| Build integration	                          | Yes	   | No       | Yes	       | Yes	   |
| Metrics trends	                          | Yes    | No       | Yes        | No        |
| Automation	                              | Yes	   | No	      | Yes	       | No        |
| Web based dashboard                         | Yes    | No       | Yes        | No        |

# Summary

Intelij Ultimate, JArchitect, CppDepend, NDepend have more or less similar DSM capabilities.
If architecture refactoring is necessary, then Lattix or the DSMSuite are required. 
The commercial Lattix tool is still the best choice, when advanced DSM features are required.

Structure101 also supports architectural refactoring, but does not support DSM visualization. 