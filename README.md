# Java binding for wkhtmltopdf library

This is a simple Java binding for `wkhtmltopdf` which provides a class with a single method which allows to convert an HTML sting into PDF.

## Sample usage
```
WKHtmlToPdf wkhtmltopdf = new WKHtmlToPdf();
wkhtmltopdf.convert("<html><body>Hello Native World!</body></html>", "./test.pdf");
```

## Compilation
In order to compile the library you first need to install `wkhtmltopdf` from http://wkhtmltopdf.org/.

After that just run `make`:
```
make
```

This command will compile Java classes as well as `wkhtmltopdf` Java bindings 
and store results in `target/` directory.

If you want to run a quick test run `make run`. After it's done you should see file named `test.pdf`.
