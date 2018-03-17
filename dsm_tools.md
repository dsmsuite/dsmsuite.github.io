---
layout: default
---

# Tools for evaluating code architectures.

# Overview of tools

| Tool		                                                | Purpose                                    | Type        |
|:----------------------------------------------------------|:-------------------------------------------|:------------|
| [Lattix DSM Tool](http://lattix.com/)                     | Software architecture analysis/refactoring | commercial  | 
| [Intelij IDEA Ultimate](https://www.jetbrains.com/idea/)  | Java IDE                                   | commercial  | 
| [CppDepend](https://www.cppdepend.com/)                   | Software architecture/code analysis        | commercial  | 
| [NDepend](https://www.ndepend.com/)                       | Software architecture/code analysis        | commercial  | 
| [JArchitect](https://www.jarchitect.com/)                 | Software architecture/code analysis        | commercial  | 
| [DSM plugin](https://github.com/tecsoft/dsm-vs-addin)     | Software architecture analysis             | open source | 
| [DSMSuite](https://dsmsuite.github.io/)                   | Software architecture analysis             | open source | 

> Other well known tools for architecture analysis and refactoring are [Structure101](http://structure101.com/) 
> and [SonarSource](https://www.sonarsource.com/). Both however do not support DSM visualization. 
> The continuous inspection tool [sonarqube](https://www.sonarqube.org/) used to support DSM visualization, but this feature was dropped. 

# Feature overview


|	                                          | Lattix | Intelij Ultimate  | JArchitect CppDepend NDepend | DsmSuite  |
|:--------------------------------------------|:-------|:---------|:-----------|:----------|
| **Visualization dependencies**              |        |          |            |           |           
| Hierarchical matrix	                      | Yes	   | Yes	  | Yes        | Yes	   |  
| Cyclic dependencies	                      | Yes    | Yes	  | Yes	       | Yes       |
| Indirect dependencies	                      | No	   | No	      | Yes	       | No        |	
| Dependencies up to method / attribute level | Yes	   | No	      | Yes	       | No        |	
| **Architecture analysis and assessment**    |        |          |            |           |
| Number of partitioning algorithms           | 11	   | 1	      | 1	       | 1         |
| Number of software metrics	              | 24	   | 0	      | 82	       | 0         |
| **Architecture control**                    |        |          |            |           |
| Simulate refactoring	                      | Yes    | No       | No	       | No        |
| Definition dependency rules	              | Yes	   | no       | Yes        | No        |
| Build integration	                          | Yes	   | No       | Yes	       | Yes	   |
| Metrics trends	                          | Yes    | No       | Yes        | No        |
| Automation	                              | Yes	   | No	      | Yes	       | No        |

# Summary

Intelij Ultimate, JArchitect, CppDepend, NDepend and the DsmSuite have more or less similar DSM capabilities.
If architecture refactoring is necessary, then Lattix is the best choice. 
Structure101 also supports architectural refactoring, but does not support DSM visualization. 

[back](about)