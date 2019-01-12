package examples;

import com.github.inikolaev.WKHtmlToPdf;

/**
 * Created with IntelliJ IDEA.
 * User: inikolaev
 * Date: 6/2/16
 * Time: 8:21 PM
 * To change this template use File | Settings | File Templates.
 */
public class WKHtmlToPdfExample {
    public static void main(String[] args) {
        WKHtmlToPdf wkHtmlToPdf = new WKHtmlToPdf();
        wkHtmlToPdf.convert("<html><body><h1>Hello Native World!</h1></body></html>", "./test.pdf");
    }
}
