# Downloads

## System requirements
* Windows platform with .NET 4.6.2 framework
* 64 bits CPU

## Latest version

| Description            | Version        | Download                                                                                                 |
|:-----------------------|----------------+----------------------------------------------------------------------------------------------------------|
| Full dsm suite         | 1.0.7681.13625 | [link](https://dsmsuite.github.io/downloads/DsmSuite_1.0.7681.13625.msi)                                 |

## Sample models 

| Description            | Download                                                                                                 |
|:-----------------------+----------------------------------------------------------------------------------------------------------|
| Example model          | [link](https://dsmsuite.github.io/downloads/SampleModel.dsm)                                             |
| DsmSuite model         | [link](https://dsmsuite.github.io/downloads/DsmSuite.dsm)                                                |
| ArgoUml model          | [link](https://dsmsuite.github.io/downloads/ArgoUml.dsm)                                                 |

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
	
## 19 December 2019 - Version 1.0.7292.9302

* Functionality to edit models 
    * Create, edit and delete elements
    * Create, edit and delete relations    
    * Move up/ move down partition
    * Undo functionality	
	
## 23 December 2019 - Version 1.0.7296.39969

* Improved edit model features
* Saving edit actions to file

## 26 December 2019 - Version 1.0.7299.26182

* Implemented option update existing dsm model with new dsi model
* Refined look&feel

## 30 December 2019 - Version 1.0.7303.12948

* Again refined look&feel
* Metrics bar in matrix currently showing number of elements and consumers and providers
* Enable ok button if edit dialogs when data is valid
* Made element search by name case insensitive
* Fixed model not cleared when loading new model
* Improved performance matrix view for large expanded models
* Reduce font size to 11 and limit weight to max 9999 to avoid drawing out side of cell
* Fixed thats actions in data model where not cleared when clearing actions via UI
* Fixed crash when element at bottom of dsm was deleted

## 1 Januari 2020 - Version 1.0.7305.36212

* Improved metrics view including cyles
* UI themes support
* Persist viewer settings in user folder
* Make visual distinction between system and hierarchical cycle
* Indicate consumers and providers with small colored status bar upon hovering over element
* Fix actions properly cleaned
* Fixed that dependency weights were not properly calculated after moving an element

## 6 Januari 2020 - Version 1.0.7310.12684

* Add beta feature toggle
    * Added to settings dialog
    * Changed 'move element in hierarchy using drag and drop' to beta feature, because it is not fully mature
* Always log exceptions
* Fix element order always updated after any element edit action
* Several UI layout and theme changes
* Fixed cell colors when first child expanded
* Fixed issue with show cycles setting

## 14 Januari - Version DsmSuite_1.0.7318.22276

* Single toot introduced in DSM
* Fixed some defects related to change element parent
* Fixed issue with show cycles setting
* Fixed feature change element parent
* Added name to single root
* Fix enable undo buton after dragging element

## 18 Januari 2020 - Version 1.0.7322.12836

* Improved layout settings dialog
* Remove prefix single root from transformer
* Fixed create element in root
* Ensure undo command is enabled again after element is dragged
* Change name builder setting

## 19 Januari 2020 - Version 1.0.7323.12273

* Fixed transitive includes not generated by transformer due to key not converted to lower case

## 12 April 2020 - Version 1.0.7407.13761

* Improved progress reporting
* Improved C++ analzyer
* Extend relations view with consumer and provider type
* Always log user messages
* Speedup dsm builder performance

## 27 April 2020 - Version 1.0.7422.19649

* Fix cell tooltip

## 30 april 2020 - Version 1.0.7425.17003

* Fix matrix not always fully visible when scrolling 

## 5 May 2020 - Version 1.0.7431.22253

* Improved search feature

## 11 May 2020 - Version 1.0.7436.13790

* Added case sensitive search option

## 13 May 2020 - Version 1.0.7438.21088

* Added relative size and cycality percentage metrics
* Fixed defect with element expand when last element moved out

## 15 May 2020 - Version 1.0.7440.13841

* Updated metrics visualization
* Color code consumers and providers for selected instead of hovered element

## 24 July 2020 - Version 1.0.7510.32647

* Removed scanning for duplicated files from Visual Studio analyzer
* Implemented context DSM in Viewer

## 24 August 2020 - Version 1.0.7541.13270

* Improved screenshot image size
* Drastically improved performance of move element by only recalculating weight relations outside moved element and by reducing number of dictionary lookups
* Show external relations metric

## 5 Sep 2020 - Version 1.0.7553.19656

* Fixed hangup when dragging element to one of its children
* Fixed defect in element name editing and provide user help condition why name change is not allowed
  * Name unchanged
  * Name empty
  * Name contains dot character
  * Name conflicts with existing name because each full name should unique

## 7 Sep 2020 - Version 1.0.7555.13887

* Fixed defect in derived weight calculated at slight performance cost
* Show version number in title bar

## 9 Sep 2020 - Version 1.0.7557.30930

* Fixed defect that only four digits show in column header
* Changed settings default from hide cycles to show cycles
* Reverted change logging path to avoid crash

## 10 Sep 2020 - Version 1.0.7558.15280

* Fixed defect in derived weight calculated without performance cost and added unit tests

## 21 Sep 2020 - Version 1.0.7569.21989 

* DSM Viewer
  * Bookmarks and annotations added
  * No compatible change in persisting edit action  in DSM 
  * Added legend
* DSM builder
  * Restored import by updating existing model restored
* Compare tool added to report differences between two DSI files

## 23 Sep 2020 - Version 1.0.7571.15419

* DSM Viewer 
  * Implemented rich tooltips for matrix
  
## 25 Sep 2020 - Version 1.0.7573.13752
  
* DSM Viewer
  * When moving element drop at correct location
 When undoing move element restore at original location
	
## 26 Sep 2020 - Version 1.0.7574.17964

* DSM Viewer
  * Improved selection of element indicator view mode (consumer/provider, search, bookmarks, annatations)
  
## 28 Sep 2020 - Version 1.0.7576.14412
  
* DSM Viewer
  * Introduced search settings: case sensitive and search scope
  
## 2 Oct 2020 - Version 1.0.7580.14844

* DSM Viewer
  * Fix problem that when model becomes corrupted progress bar not hidden when loading or saving model
  * Fix problem index out range when moving elements
  * Rename element automatically when moving element to new parent where another child with same name as the moved element exist to avoid model corruption
* Visual Studio Analyzer
  * Improve setting global properties of projects to avoid exceptions when loading projects
  * Use Microsoft.Build api to analyze solution file
  
## 3 Oct 2020 - Version 1.0.7581.18682

* DSM Viewer
  * Remove noticable delay in cell context menu
  * Validate actions for valid data and clear when not all actions valid
  * Sort element and relation lists
* Visual Studio Analyzer
  * Write list of analyzed projects to log file
  
## 20 Oct 2020 - Version 1.0.7598.39024
  
* Visual Studio Analyzer
  * Restored ToolsVersion settings   

## 30 Nov 2020 - Version 1.0.7639.20856

* Visual Studio Analyzer  
  * Support macros in AdditionalIncludeDirectories  
  
## 2 Dec 2020 - Version 1.0.7641.11706

* Visual Studio Analyzer  
  * Support macros in AdditionalIncludeDirectories improved logging

## 3 Dec 2020 - Version 1.0.7642.14529

* Visual Studio Analyzer  
  * Support macros in AdditionalIncludeDirectories improved logging
  * Log project properties to file for analysis when LogProjectData=true in analyzer settings file
  
## 4 Dec 2020 - Version 1.0.7643.13145
  
* Visual Studio Analyzer  
  * Support macros in AdditionalIncludeDirectories improved logging  
  
## 5 Dec 2020 - Version 1.0.7644.16475
  
* Visual Studio Analyzer  
  * Restored cloned interface file during analysis
  
## 26 Dec 2020 - Version 1.0.7665.40636

* Split settings files into input, analysis, transformation and output section
* Replace logging enabled by loglevel
* Integrated transformer into analysers, to avoid extra step.
* Only calculate visual studio source file checksum when interface directorires are defined
* Cleanup of code

## 28 Dec 2020 - Version 1.0.7667.40861

* Log assembly info as user messages
* Visual Studio Analyzer
  * Only verify checksums when interface directories defined
* DSM Viewer
  * Fix take screenshot
  
## 29 Dec 2020 - Version 1.0.7668.40674

* Log datamodel relation not resolved as error  
* Improved compare tool
* Visual Studio Analyzer
  * Fix incorrect reported resolved relation count due to not ignoring system includes
  
## 02 Jan 2021 - Version 1.0.7672.41007

* DSM Viewer
  * Improved look&feel DSM 
  * Direct import DSI file
  * Avoid errors when editing and provide help messages for editing errors
  
## 04 Jan 2021 - Version 1.0.7674.19700

* Removed not longer needed DSM builder to simplify workfow
* Visual Studio Analyzer
  * Improved speed 
  * Improved distinction between solution and directory view
  * Improved logging of files found in multiple visual studio projects or none at all
* DSM Viewer 
  * Fix screenshot
  
## 05 Jan 2021 - Version 1.0.7675.30795
  
* Visual Studio Analyzer
  * Improved speed  
* DSM Viewer 
  * Allow open dsi file when file type associated  
  
## 07 Jan 2021 - Version 1.0.7677.13782

* Visual Studio Analyzer
  * Design cleanup analyzer 
* All
  * Fixed resharper issues  
  
## 11 Jan 2021 - Version 1.0.7681.13625

* Visual Studio Analyzer
  * Improved include file detection
  * Support forced includes
* C++ Analyzer
  * Improved include file detection