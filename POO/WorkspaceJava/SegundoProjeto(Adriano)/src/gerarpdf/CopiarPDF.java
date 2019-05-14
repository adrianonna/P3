package gerarpdf;
import java.io.FileOutputStream;

import com.itextpdf.text.Document;
import com.itextpdf.text.Rectangle;
import com.itextpdf.text.pdf.BaseFont;
import com.itextpdf.text.pdf.PdfContentByte;
import com.itextpdf.text.pdf.PdfImportedPage;
import com.itextpdf.text.pdf.PdfReader;
import com.itextpdf.text.pdf.PdfWriter;


public class CopiarPDF{

	public static void main(String[] args) {
		try {
			// cria o reader para o pdf 
			PdfReader reader = new PdfReader("pdf//teste.pdf");
			// numero total de p�ginas
			int n = reader.getNumberOfPages();
			// tamanho da primeira p�gina
			Rectangle psize = reader.getPageSize(1);
			float width = psize.getHeight();
			float height = psize.getWidth();

			// crie o segundo pdf igual ao primeiro
			Document document = new Document(new Rectangle(width, height));
			PdfWriter writer = PdfWriter.getInstance(document, new FileOutputStream("pdf//SegundoPDF.pdf"));
			document.open();
			// adiciona conte�do ao segundo pdf
			PdfContentByte cb = writer.getDirectContent();
			int i = 0;
			int p = 0;
			while (i < n) {
				document.newPage();
				p++;
				i++;
				PdfImportedPage page1 = writer.getImportedPage(reader, i);
				cb.addTemplate(page1, .5f, 0, 0, .5f, 60, 120);
				if (i < n) {
					i++;
					PdfImportedPage page2 = writer.getImportedPage(reader, i);
					cb.addTemplate(page2, .5f, 0, 0, .5f, width / 2 + 60, 120);
				}
				BaseFont bf = BaseFont.createFont(BaseFont.HELVETICA, BaseFont.CP1252, BaseFont.NOT_EMBEDDED);
				cb.beginText();
				cb.setFontAndSize(bf, 14);
				cb.showTextAligned(PdfContentByte.ALIGN_CENTER, "page " + p + " of " + ((n / 2) + (n % 2 >
				0? 1 : 0)), width / 2, 40, 0);
				cb.endText();
			}
			document.close();
			System.out.println("PDF copiado com sucesso!");
		}
		catch (Exception de) {
			de.printStackTrace();
		}
	}
}