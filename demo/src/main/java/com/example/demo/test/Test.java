package com.example.demo.test;

import org.apache.poi.xwpf.usermodel.XWPFDocument;

import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;

/**
 * <p>demo</p>
 *
 * @author cq
 * @Description
 * @date 2020/8/14 11:05
 */
public class Test {
    public static void main(String[] args) throws IOException {

        FileInputStream  fis= (FileInputStream) Test.class.getResourceAsStream("/template/3.docx");
//

        XWPFDocument doc = new XWPFDocument(new FileInputStream("E:/api-work/api-model/api-tool/demo/src/main/resources/template3.docx"));

        doc.createTable(9,7);


        OutputStream os = new FileOutputStream("E:/1.docx");
        doc.write(os);
        os.close();
    }
}
