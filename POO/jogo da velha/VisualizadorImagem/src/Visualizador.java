import java.awt.EventQueue;
import java.awt.Image;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;

import javax.imageio.ImageIO;
import javax.swing.ImageIcon;
import javax.swing.JButton;
import javax.swing.JFileChooser;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.SwingConstants;
import javax.swing.filechooser.FileFilter;

public class Visualizador {

	private JFrame frmPrincipal;
	private JLabel label1;
	private JLabel label2;
	private String[] nomes = {"1.jpg", "2.jpg","3.jpg","4.jpg","5.jpg","6.jpg","7.jpg","8.jpg"};

	/**
	 * Launch the application.
	 */
	public static void main(String[] args) {

		EventQueue.invokeLater(new Runnable() {
			public void run() {
				try {
					Visualizador window = new Visualizador();
					window.frmPrincipal.setVisible(true);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		});
	}

	/**
	 * Create the application.
	 */
	public Visualizador() {
		initialize();
	}

	/**
	 * Initialize the contents of the frame.
	 */
	private void initialize() {
		frmPrincipal = new JFrame();
		frmPrincipal.setTitle("ler imagem de arquivo");
		frmPrincipal.setBounds(100, 100, 339, 207);
		frmPrincipal.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		frmPrincipal.getContentPane().setLayout(null);


		label1 = new JLabel("imagem");
		label1.setHorizontalAlignment(SwingConstants.CENTER);
		label1.setSize(97, 79);
		label1.setLocation(114, 56);
		frmPrincipal.getContentPane().add(label1);

		label2 = new JLabel("arquivo");
		label2.setHorizontalAlignment(SwingConstants.CENTER);
		label2.setBounds(53, 143, 220, 14);
		frmPrincipal.getContentPane().add(label2);
		
		JButton btnSortear = new JButton("Sortear aqrquivo");
		btnSortear.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent arg0) {
				int n = (int) (Math.random()*8);  //0 a 7
				ImageIcon icon =new ImageIcon(Visualizador.class.getResource("/imagens/"+ nomes[n]));
				icon.setImage(icon.getImage().getScaledInstance(label1.getWidth(), label1.getHeight(), 1) );
				label1.setIcon(icon);
				label2.setText("/imagens/"+ nomes[n]);
			}
		});
		btnSortear.setBounds(10, 22, 138, 23);
		frmPrincipal.getContentPane().add(btnSortear);
		
		JButton button = new JButton("Selecionar arquivo");
		button.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent arg0) {
				JFileChooser fc = new JFileChooser(new File("C:"));
				FileFilter ft = new FileFilter() {
					@Override
					public boolean accept(File f) {
						String file = f.getName();
						return file.endsWith(".jpg") | f.isDirectory();          
					}
					@Override
					public String getDescription() {
						return "jpg";
					}
				};
				fc.setFileFilter(ft);
				fc.showOpenDialog(null);
				File f = fc.getSelectedFile();	
				if (f==null) return;
				BufferedImage buffer;
				try {
					buffer = ImageIO.read(f);
					ImageIcon icon = new  ImageIcon(buffer.getScaledInstance(buffer.getWidth(), buffer.getHeight(),Image.SCALE_DEFAULT));
					label1.setIcon(icon);
					label2.setText(f.getName());//exibir nome do arquivo
				} catch (IOException e) {
					e.printStackTrace();
				}	
				
			}
		});
		button.setBounds(158, 22, 155, 23);
		frmPrincipal.getContentPane().add(button);
	}
}
