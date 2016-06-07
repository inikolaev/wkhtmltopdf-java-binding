package com.github.inikolaev;

/**
 * Created with IntelliJ IDEA.
 * User: inikolaev
 * Date: 6/2/16
 * Time: 8:21 PM
 * To change this template use File | Settings | File Templates.
 */
public class WKHtmlToPdf {
    static { System.loadLibrary("WKHtmlToPdfJavaBinding"); }

    public native void convert(String html, String path);

    public static void main(String[] args) {
        WKHtmlToPdf wkHtmlToPdf = new WKHtmlToPdf();
        wkHtmlToPdf.convert("<html><body><h1>Hello Native World!</h1></body></html>", "./test1.pdf");
    }
}
