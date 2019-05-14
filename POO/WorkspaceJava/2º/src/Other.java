import java.awt.EventQueue;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.JPasswordField;
import javax.swing.JTextField;

public class Other {

	private JFrame frame;
	private JLabel label;
	private JLabel label_1;
	private JTextField textField_1;
	private JPasswordField passwordField;
	private JPasswordField passwordField_1;

	/**
	 * Launch the application.
	 */
	public static void main(String[] args) {
		EventQueue.invokeLater(new Runnable() {
			public void run() {
				try {
					Other window = new Other();
					window.frame.setVisible(true);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		});
	}
	
	/**
	 * Create the application.
	 */
	public Other() {
		initialize();
	}

	/**
	 * Initialize the contents of the frame.
	 */
	private void initialize() {
		frame = new JFrame();
		frame.setTitle("Login");
		frame.setBounds(100, 100, 450, 300);
		frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		frame.getContentPane().setLayout(null);
		
		label = new JLabel("Senha:");
		label.setBounds(10, 36, 46, 14);
		frame.getContentPane().add(label);
		
		JButton button = new JButton("Login");
		button.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent arg0) {
				if (textField_1.toString() == "ifpb") { //Condição para que se a senha for igual a ifpb, aparecer mensagem.
					JOptionPane.showMessageDialog(null, "Senha aceita!");
				}
			}
		});
		button.setBounds(2, 65, 70, 23);
		frame.getContentPane().add(button);
		
		label_1 = new JLabel("Nome:");
		label_1.setBounds(10, 11, 46, 14);
		frame.getContentPane().add(label_1);
		
		textField_1 = new JTextField();
		textField_1.setBounds(66, 8, 94, 20);
		frame.getContentPane().add(textField_1);
		textField_1.setColumns(10);
		
		passwordField = new JPasswordField();
		passwordField.setBounds(110, 36, -38, 17);
		frame.getContentPane().add(passwordField);
		
		passwordField_1 = new JPasswordField();
		passwordField_1.setBounds(66, 33, 94, 20);
		frame.getContentPane().add(passwordField_1);
		
		JButton button_1 = new JButton("Limpar");
		button_1.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent arg0) {
				//apaga nome e senha
				textField_1.requestFocus(); //coloca focus no nome
			}
		});
		button_1.setBounds(82, 65, 78, 23);
		frame.getContentPane().add(button_1);
	}
}
