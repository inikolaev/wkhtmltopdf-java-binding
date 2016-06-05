#include <stdbool.h>
#include <stdio.h>
#include <wkhtmltox/pdf.h>
#include "WKHtmlToPdfImpl.h"

void convert(const char* html, const char* path) {
    wkhtmltopdf_global_settings * gs;
    wkhtmltopdf_object_settings * os;
    wkhtmltopdf_converter * c;

    /* Init wkhtmltopdf in graphics less mode */
    wkhtmltopdf_init(false);

    /*
     * Create a global settings object used to store options that are not
     * related to input objects, note that control of this object is parsed to
     * the converter later, which is then responsible for freeing it
     */
    gs = wkhtmltopdf_create_global_settings();
    /* We want the result to be storred in the file called test.pdf */
    wkhtmltopdf_set_global_setting(gs, "out", path);

    /*
     * Create a input object settings object that is used to store settings
     * related to a input object, note again that control of this object is parsed to
     * the converter later, which is then responsible for freeing it
     */
    os = wkhtmltopdf_create_object_settings();

    /* Create the actual converter object used to convert the pages */
    c = wkhtmltopdf_create_converter(gs);

    /*
     * Add the the settings object describing the qstring documentation page
     * to the list of pages to convert. Objects are converted in the order in which
     * they are added
     */
    wkhtmltopdf_add_object(c, os, html);

    /* Perform the actual convertion */
    if (!wkhtmltopdf_convert(c))
        fprintf(stderr, "Convertion failed!");

    /* Destroy the converter object since we are done with it */
    wkhtmltopdf_destroy_converter(c);

    /* We will no longer be needing wkhtmltopdf funcionality */
    wkhtmltopdf_deinit();
}

JNIEXPORT void JNICALL Java_WKHtmlToPdf_convert(JNIEnv *env, jobject obj, jstring html, jstring path) {
    const char *nativeHtml = (*env)->GetStringUTFChars(env, html, 0);
    const char *nativePath = (*env)->GetStringUTFChars(env, path, 0);

    convert(nativeHtml, nativePath);

    (*env)->ReleaseStringUTFChars(env, html, nativeHtml);
    (*env)->ReleaseStringUTFChars(env, path, nativePath);
}
