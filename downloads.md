# Downloads

## System requirements
* Windows platform with .NET 4.6.2 framework
* 64 bits CPU

## Latest versions

| Description            | Version        | Download                                                                                                 |
|:-----------------------|----------------+----------------------------------------------------------------------------------------------------------|
| Viewer and builder     | 1.0.7064.15505 | [link](https://dsmsuite.github.io/downloads/DsmSuite.DsmViewer.Installer_1.0.7064.15505.msi)             |
| Transformer            | 1.0.7064.15508 | [link](https://dsmsuite.github.io/downloads/DsmSuite.Transformer.Installer_1.0.7064.15508.msi)           |
| .Net analyzer          | 1.0.7064.15507 | [link](https://dsmsuite.github.io/downloads/DsmSuite.Analyzer.DotNet.Installer_1.0.7064.15507.msi)       |
| Java analyzer          | 1.0.7064.15508 | [link](https://dsmsuite.github.io/downloads/DsmSuite.Analyzer.Jdeps.Installer_1.0.7064.15508.msi)        |
| C++ analyzer           | 1.0.7064.15508 | [link](https://dsmsuite.github.io/downloads/DsmSuite.Analyzer.Cpp.Installer_1.0.7064.15508.msi)          |
| Visual Studio analyzer | 1.0.7072.37000 | [link](https://dsmsuite.github.io/downloads/DsmSuite.Analyzer.VisualStudio.Installer_1.0.7072.37000.msi) |
| UML analyzer           | 1.0.7064.15508 | [link](https://dsmsuite.github.io/downloads/DsmSuite.Analyzer.Uml.Installer_1.0.7064.15508.msi)          |

See [All downloads](all_downloads) for all downloads including older versions.

# Change History

## 9 March 2019 - Version 1.0.7007

* Initial release 

## 12 March 2019 - Version 1.0.7010

* Fixed DSM viewer not showing element numbers and cyclic dependencies in yellow when requested

## 19 March 2019 - Version 1.0.7017

* Visual studio analyzer
	* Added exception logging when filter file can not be parsed

## 20 March 2019 - Version 1.0.7018

* Visual studio analyzer 
	* Make tools version configurable (default is 14.0)
	* Log error instead of exception when source file in visual studio project not found  
* Log full stack trace when logging exception

## 26 March 2019 - Version 1.0.7025

* DSM viewer and builder
	* Very large performance improvements on DSM builder and viewer to support large models
	* DSM builder and viewer are now 64bits processes

## 2 April 2019 - Version 1.0.7031

* Visual studio analyzer 
	* Do not remove solution and project file extensions show they show up as separate elements in DSM
* DSM viewer and builder
	* Speedup loading DSM files by avoiding multiple xml parse runs
	
## 16 April 2019 - Version 1.0.7045

* General
    * Add metadata to dsi and dsm files and show them in overview report
	* Add setting to determine if output should be written in compressed format
	* Auto detect compressed .dsi or .dsm files during reading
* DSM viewer
    * Improved overview html report	
	* Improve visibility numbers in matrix column header
	
## 28 April 2019 - Version 1.0.7057

* DSM viewer
    * Added new html reports
	    * Consumers and providers of selected matrix cell
		* Provided and required interfaces of selected element
		
## 5 May 2019 - Version 1.0.7064
		
* DSM viewer
    * Improved html reports
* Transformer  
    * Used regex for filters
* Visual studio analyzer
    * Extended unit tests for dynamic folder property

## 13 May 2019 - Version 1.0.7072	

* Visual studio analyzer 
	* Add target extension to visual studio project file element