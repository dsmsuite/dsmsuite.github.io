# Downloads

## System requirements
* Windows platform with .NET 4.6.2 framework
* 64 bits CPU

## Latest versions

| Description            | Version        | Download                                                                 |
|:-----------------------|----------------+--------------------------------------------------------------------------|
| Full dsm suite         | 1.0.7299.26182 | [link](https://dsmsuite.github.io/downloads/DsmSuite_1.0.7299.26182.msi) | 

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

## 14 May 2019 - Version 1.0.7073	

* Visual studio analyzer 
	* Add target extension to visual studio project file element
	
## 4 December 2019 - Version 1.0.7277.38011

* Single installer for entire DSM suite
* Minor non compatible changes in DSI and DSM model formats
* Viewer fully rewritten in WPF
    * Improved look & feel 
	* Show detail matrix for element or relation
	* Search element feature
	* Progress bar while opening or saving files
	* Open dsm file by clicking it after associating .dsm extension with DSM viewer
	
## 19 December - Version 1.0.7292.9302

* Functionality to edit models 
    * Create, edit and delete elements
    * Create, edit and delete relations    
    * Move up/ move down partition
    * Undo functionality	
	
## 23 December - Version 1.0.7296.39969

* Improved edit model features
* Saving edit actions to file

## 26 December - Version 1.0.7299.26182

* Implemented option update existing dsm model with new dsi model
* Refined look&feel