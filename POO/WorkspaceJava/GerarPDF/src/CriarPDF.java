
import java.io.FileOutputStream;
import java.io.IOException;

import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Image;
import com.itextpdf.text.PageSize;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.pdf.PdfWriter;

public class CriarPDF {
	
	public static void main(String[] args) {
		// criação do objeto documento
		Document document = new Document();
		try {
			//Instanciando o documento PDF
			PdfWriter.getInstance(document, new FileOutputStream("pdf/teste.pdf"));


			//O tamanho padrão (default) do pdf gerado pelo iText é o A4.
			//Com o uso do método setPageSize somos capazes de modificar esse atributo.
			//Setando o tamanho do documento PDF
			document.setPageSize(PageSize.A4);

			//Adicionando um titulo ao arquivo
			document.addSubject("Testando criação de PDF em Java com api Itext");

			//adicionando uma senha para abrir o arquivo
			document.addKeywords("123");

			//setando o criador do arquivo
			document.addCreator("iText");

			//setando o autor do arquivo criado
			document.addAuthor("Joseph Adrian Almeida dos Santos");

			//Abrindo o documento PDF criado
			document.open();

			// adicionando um parágrafo ao documento
			document.add(new Paragraph("Testando PDF em java usando iText"));

			//Para inserir uma imagem em um documento pdf, 
			//temos que utilizar getInstance na imagem que você deseja adicionar, 
			//passando como parâmetro o seu caminho (path) e depois adicionar no seu documento com o uso do método add(), 
			//como segue abaixo:


			//adcionando uma imagem ao arquivo
			Image imagem = Image.getInstance("imagens_Itext//lobo.jpg");

			//Setando o tamanho da imagem
			imagem.scaleToFit(300, 200);

			//Adicionando a imagem ao documento
			document.add(imagem);

			//É possível também adicionar mais páginas para o nosso arquivo pdf, que até agora com possui somente uma página. 
			//Essa tarefa é bem simples, basta adicionar um newPage no nosso objeto PDF.
			//Criando uma nova página no arquivo PDF
			document.newPage();

			document.add(new Paragraph("OUTRA PÁGINA CRIADA COM SUCESSO"));
			document.add(imagem);

			document.close();

			//Se arquivo for criado com sucesso, é exibida uma mensagem de confirmação
			System.out.println("PDF criado com sucesso!");
		}
		catch(DocumentException de) {         
			System.out.println(de.getMessage());
		}
		catch(IOException ioe) {
			System.out.println(ioe.getMessage());
		}
		document.close();
	}   


}
