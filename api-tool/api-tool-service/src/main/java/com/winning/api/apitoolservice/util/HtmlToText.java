package com.winning.api.apitoolservice.util;

import javax.swing.text.html.HTMLEditorKit;
import javax.swing.text.html.parser.ParserDelegator;
import java.io.*;

/**
 * <p>api-tool</p>
 *
 * @author cq
 * @Description
 * @date 2020/8/17 9:51
 */
public class HtmlToText extends HTMLEditorKit.ParserCallback{

    private static HtmlToText html2Text = new HtmlToText();

    StringBuffer stringBuffer;

    private HtmlToText() {
    }

    public void parse(String str) throws IOException {

        InputStream iin = new ByteArrayInputStream(str.getBytes());
        Reader in = new InputStreamReader(iin);
        stringBuffer = new StringBuffer();
        ParserDelegator delegator = new ParserDelegator();
        // the third parameter is TRUE to ignore charset directive
        delegator.parse(in, this, Boolean.TRUE);
        iin.close();
        in.close();
    }

    public void handleText(char[] text, int pos) {
        stringBuffer.append(text);
    }

    public String getText() {
        return stringBuffer.toString();
    }

    public static String getContent(String str) {
        try {
            html2Text.parse(str);
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return html2Text.getText();
    }

    public static void main(String[] args) {
        String text = HtmlToText.getContent("<p>123</p>");
        System.out.println(text);
    }
}
