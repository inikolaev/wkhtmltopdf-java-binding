#!/bin/bash

rm -rf ./target
mkdir ./target
javac -d ./target src/main/java/WKHtmlToPdf.java
javah -o src/main/c/WKHtmlToPdfImpl.h -classpath ./target com.github.inikolaev.WKHtmlToPdf
