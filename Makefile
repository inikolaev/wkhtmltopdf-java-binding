.PHONY: all run

JAVA_HOME := $(shell /usr/libexec/java_home)

all:
	@echo "Java Home: ${JAVA_HOME}"

	@echo "Cleaning target directory"
	@rm -rf target/

	@mkdir -p target/lib target/classes
	@javac -d ./target/classes $(shell find src/main/java -name "*.java")

	@echo "Generating header files"
	@javah -o src/main/c/WKHtmlToPdfImpl.h -classpath ./target/classes com.github.inikolaev.WKHtmlToPdf

	@echo "Compiling sources"
	@gcc -o target/lib/libWKHtmlToPdfJavaBinding.jnilib \
	  -lc -shared \
	  -I./src/main/c/ \
	  -I${JAVA_HOME}/include \
	  -I${JAVA_HOME}/include/darwin \
	  -I/usr/local/include/ \
	  -L/usr/local/lib -lwkhtmltox \
	  ./src/main/c/WKHtmlToPdfImpl.c

	@echo "Done"

run:
	@echo "Running example"
	@java -Djava.library.path=./target/lib -cp ./target/classes examples.WKHtmlToPdfExample
	@echo "Done"
