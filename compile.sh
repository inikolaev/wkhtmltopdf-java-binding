#!/bin/bash

JAVA_VERSION=$(java -version 2>&1 | grep "java version" | tr -d "[:alpha:][:space:]\"")

echo "Detected Java version ${JAVA_VERSION}"

mkdir -p target/lib

gcc -o target/lib/libWKHtmlToPdfJavaBinding.jnilib \
  -lc -shared \
  -I./src/main/c/ \
  -I/Library/Java/JavaVirtualMachines/jdk${JAVA_VERSION}.jdk/Contents/Home/include \
  -I/Library/Java/JavaVirtualMachines/jdk${JAVA_VERSION}.jdk/Contents/Home/include/darwin \
  -I/usr/local/include/ \
  -L/usr/local/lib -lwkhtmltox \
  ./src/main/c/WKHtmlToPdfImpl.c
