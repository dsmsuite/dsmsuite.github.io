call "C:\dex2jar-2.0\d2j-dex2jar.bat" -f D:\DsmInputData\Android\CoronaMelder\coronamelder.apk -o D:\DsmInputData\Android\CoronaMelder\coronamelder.jar
"C:\Program Files\Java\jdk-15.0.2\bin\jdeps" -verbose:class -recursive -classpath D:\DsmInputData\Android\CoronaMelder -dotoutput JdepsOutput D:\DsmInputData\Android\CoronaMelder\coronamelder.jar
"C:\Program Files\DsmSuite\Analyzers\Java\DsmSuite.Analyzer.Jdeps.exe" AnalyzerSettings.xml
