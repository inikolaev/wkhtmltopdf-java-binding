#!/bin/bash

JAVA_HOME=$(/usr/libexec/java_home)

mkdir -p target/lib

gcc -o target/lib/libWKHtmlToPdfJavaBinding.jnilib \
  -lc -shared \
  -I./src/main/c/ \
  -I${JAVA_HOME}/include \
  -I${JAVA_HOME}/include/darwin \
  -I/usr/local/include/ \
  -L/usr/local/lib -lwkhtmltox \
  ./src/main/c/WKHtmlToPdfImpl.c
