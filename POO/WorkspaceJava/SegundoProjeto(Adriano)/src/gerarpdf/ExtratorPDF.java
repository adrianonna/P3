package gerarpdf;
import com.itextpdf.text.Rectangle;
import com.itextpdf.text.pdf.PdfReader;
import com.itextpdf.text.pdf.parser.PdfTextExtractor;


public class ExtratorPDF{

	public static void main(String[] args) {
		try {
			// cria o reader para o pdf já criado
			PdfReader reader = new PdfReader("pdf//teste.pdf");
			// numero total de páginas
			int n = reader.getNumberOfPages();
			// tamanho da primeira página
			Rectangle psize = reader.getPageSize(1);
			float width = psize.getHeight();
			float height = psize.getWidth();

			System.out.println("Extraindo texto...");
			for (int i = 1; i <= n; i++) {
				// Extrai o texto do pdf
				String text = PdfTextExtractor.getTextFromPage(reader, i);

				System.out.println("==>"+text);
			}

		}
		catch (Exception de) {
			de.printStackTrace();
		}
	}
}