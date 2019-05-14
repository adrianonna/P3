package gerarpdf;

import java.io.FileOutputStream;

import com.itextpdf.text.Document;
import com.itextpdf.text.PageSize;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.pdf.PdfWriter;

import modelo.Pedido;

public class Pdf {

	public Pdf(Pedido p) {
		Document document = new Document();
		try {

			PdfWriter.getInstance(document, new FileOutputStream("pdf/teste3.pdf"));

			document.setPageSize(PageSize.A4);

			document.addSubject("Testando criação de PDF em Java com api Itext");

			document.addKeywords("123");

			document.addCreator("iText");

			document.addAuthor("Projeto POO Adriano");

			document.open();

			document.add(new Paragraph(p.toString()));
			
			document.close();
		}catch (Exception e) {
			System.out.println(e.getMessage());
		}
		document.close();
	}

}
