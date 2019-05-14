package javaemail;
import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Properties;

import javax.activation.DataHandler;
import javax.activation.FileDataSource;
import javax.mail.Address;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import javax.mail.internet.MimeMessage.RecipientType;

public class Teste {

	public static void main(String[] args) throws MessagingException{
		final String email = "fausto.ayres@gmail.com";
		final String senha = "???";

		//Setting up configurations for the email connection to the Google SMTP server using TLS
		Properties props = new Properties();
		props.put("mail.smtp.host", "true");
		props.put("mail.smtp.starttls.enable", "true");
		props.put("mail.smtp.host", "smtp.gmail.com");
		props.put("mail.smtp.port", "587");
		props.put("mail.smtp.auth", "true");

		//Establishing a session with required user details
		Session session = Session.getInstance(props, new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(email, senha);
			}
		});

		try {
			//criando a mensagem
			MimeMessage msg = new MimeMessage(session);

			//inserir os emails 
			Address from = new InternetAddress("fausto.ayres@gmail.com");
			Address to = new InternetAddress("fausto.ayres@gmail.com");

			//configurando o remetente e o destinatario
			msg.setFrom(from);
			msg.addRecipient(RecipientType.TO, to);

			//configurando a data de envio,  o assunto e o texto da mensagem
			msg.setSentDate(new Date());
			msg.setSubject("Enviando Email com mensagem e anexo");		
			msg.setSubject("Testando email: " );
			msg.setText("exemplo de email");
			msg.setHeader("XPriority", "1");
			
			
			// conteudo html que sera atribuido a mensagem
			String htmlMessage = "<html> Email com anexo </html>";
			//criando a Multipart
			Multipart multipart = new MimeMultipart();
			//criando a primeira parte da mensagem
			MimeBodyPart attachment0 = new MimeBodyPart();
			//configurando o htmlMessage com o mime type
			attachment0.setContent(htmlMessage,"text/html; charset=UTF-8");
			//adicionando na multipart
			multipart.addBodyPart(attachment0);
			//arquivo que será anexado
			String pathname = "teste.pdf";//pode conter o caminho
			File file = new File(pathname);
			//criando a segunda parte da mensagem
			MimeBodyPart attachment1 = new MimeBodyPart();  
			//configurando o DataHandler para o arquivo desejado
			//a leitura dos bytes, descoberta e configuracao do tipo
			//do arquivo serão resolvidos pelo JAF (DataHandler e FileDataSource)
			attachment1.setDataHandler(new DataHandler(new FileDataSource(file)));
			
			//configurando o nome do arquivo que pode ser diferente do arquivo
			//original 
			attachment1.setFileName(file.getName());
			
			//adicionando o anexo na multipart
			multipart.addBodyPart(attachment1);

			//adicionando a multipart como conteudo da mensagem 
			msg.setContent(multipart);
			
			Transport.send(msg);
			
			System.out.println("enviado ok");
		} catch (MessagingException mex) {
			System.out.println("problema no envio" + mex);

		}

	}

}