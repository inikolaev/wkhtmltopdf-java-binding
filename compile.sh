#!/bin/bash

gcc -o libWKHtmlToPdfJavaBinding.jnilib -lc -shared -I./src/main/c/ -I/Library/Java/JavaVirtualMachines/jdk1.7.0_67.jdk/Contents/Home/include -I/Library/Java/JavaVirtualMachines/jdk1.7.0_67.jdk/Contents/Home/include/darwin -I/usr/local/include/ -L/usr/local/lib -lwkhtmltox ./src/main/c/WKHtmlToPdfImpl.c
