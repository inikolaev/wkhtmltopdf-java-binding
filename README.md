# Java binding for wkhtmltopdf library

This is a simple Java binding for `wkhtmltopdf` which provides a class with a single method which allows to convert an HTML sting into PDF.

## Sample usage
```
WKHtmlToPdf wkhtmltopdf = new WKHtmlToPdf();
wkhtmltopdf.convert("<html><body>Hello Native World!</body></html>");
```

## Compilation
In order to compile the library you first need to install `wkhtmltopdf` from http://wkhtmltopdf.org/.

After that just run the following scripts:
```
./codegen.sh
./compile.sh
```

Later on I will replace this Maven of something more appropriate.

If you want to run a quick test execute `./run.sh`. After it's done you should see file named `test.pdf`.