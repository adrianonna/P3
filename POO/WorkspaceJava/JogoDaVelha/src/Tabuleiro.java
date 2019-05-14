import java.awt.Color;
import java.awt.EventQueue;
import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;

import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.border.LineBorder;
import javax.swing.JRadioButton;
import javax.swing.ButtonGroup;
import javax.swing.JButton;
import java.awt.event.ActionListener;
import java.awt.event.ActionEvent;
import javax.swing.JTextField;

/**
 * IFPB - TSI - POO 
 * @author Prof. Fausto Ayres
 *
 */
public class Tabuleiro  {

	private JFrame frame;
	JLabel[][] labels = new JLabel[3][3];
	private JRadioButton radioButton;
	private JRadioButton radioButton_1;
	private JButton button;
	private JButton button_1;
	private ButtonGroup grupoRadio;
	private int numeroJogador = 1;
	private JogoDaVelha jogo;
	private JTextField textField;
	private JTextField textField_1;
	private JLabel label;


	/**
	 * Launch the application.
	 */
	public static void main(String[] args) {
		EventQueue.invokeLater(new Runnable() {
			public void run() {
				try {
					Tabuleiro window = new Tabuleiro();
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
	public Tabuleiro() {
		initialize();
	}

	/**
	 * Initialize the contents of the frame.
	 */
	private void initialize() {
		frame = new JFrame();
		frame.setTitle("Matriz de Labels");
		frame.setBounds(100, 100, 417, 437);
		frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		frame.getContentPane().setLayout(null);

		radioButton = new JRadioButton("Maquina");
		radioButton.setBounds(10, 209, 89, 23);
		frame.getContentPane().add(radioButton);

		radioButton_1 = new JRadioButton("Humano");
		radioButton_1.setBounds(10, 240, 89, 23);
		frame.getContentPane().add(radioButton_1);

		//para não deixar os dois selecionados
		grupoRadio = new ButtonGroup();
		grupoRadio.add(radioButton);
		grupoRadio.add(radioButton_1);


		//Inicia o jogo
		button = new JButton("Iniciar");
		button.setBounds(105, 239, 110, 23);
		button.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent arg0) {
				if (radioButton_1.isSelected()) {
					radioButton.setEnabled(false);
					jogo = new JogoDaVelha(textField.getText(), textField_1.getText());
				} else {
					jogo = new JogoDaVelha(textField.getText());
					textField_1.setEnabled(false);
					radioButton_1.setEnabled(false);
				}
			}
		});


		frame.getContentPane().add(button);

		button_1 = new JButton("Reiniciar");
		button_1.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent arg0) {
				radioButton.setEnabled(true);
				radioButton_1.setEnabled(true);
				textField_1.setEnabled(true);
				for(int i=0; i < 3; i++){
					for(int j=0; j < 3; j++){
						labels[i][j].setText("");
						label.setText("Resultado");
					}
				}
			}
		});
		button_1.setBounds(105, 209, 110, 23);
		frame.getContentPane().add(button_1);

		//esquerdo
		textField = new JTextField();
		textField.setBounds(10, 182, 86, 20);
		frame.getContentPane().add(textField);
		textField.setColumns(10);

		//direito
		textField_1 = new JTextField();
		textField_1.setBounds(129, 182, 86, 20);
		frame.getContentPane().add(textField_1);
		textField_1.setColumns(10);

		label = new JLabel("Resultado");
		label.setBounds(10, 157, 205, 14);
		frame.getContentPane().add(label);


		//inicializar a matriz de labels
		for(int i=0; i < 3; i++){
			for(int j=0; j < 3; j++){
				labels[i][j]=new JLabel();
				frame.getContentPane().add(labels[i][j]);
				labels[i][j].setBounds(i*40, j*40, 40, 40);	//x,y, width, height - 40x40
				labels[i][j].setBackground(Color.YELLOW);
				labels[i][j].setBorder(new LineBorder(new Color(0, 0, 0)));
				labels[i][j].setOpaque(true);
				labels[i][j].addMouseListener(new  MouseAdapter(){
					public void mouseClicked(MouseEvent e){		//click
						JLabel b = (JLabel)e.getSource();
						int indicex = b.getX()/40;
						int indicey = b.getY()/40;
						//botão do humano
						if (radioButton_1.isSelected()) {
							if (!jogo.terminou()) {
								jogo.jogarJogador(numeroJogador, indicey, indicex);
								if(numeroJogador==1) {
									labels[indicex][indicey].setText("X");
								} else {
									labels[indicex][indicey].setText("O");
								}
								//trocar jogador, sempre começa com X
								if(numeroJogador==1) 
									numeroJogador=2; 
								else numeroJogador=1;
							}
						} //botão da maquina
						if (radioButton.isSelected()) {
							if (!jogo.terminou()) {
								if (numeroJogador == 1) {
									textField_1.setEnabled(false);
									jogo.jogarJogador(numeroJogador, indicey, indicex);
									labels[indicex][indicey].setText("X");
									if (!jogo.terminou()) {
										jogo.jogarMaquina();
										int linha = jogo.getUltimaLinha();
										int coluna = jogo.getUltimaColuna();
										labels[coluna][linha].setText("O");
									}
								}
							}
						}
						//labels[indicex][indicey].setBackground(Color.BLUE);
						System.out.println("clicou na celula:"+  indicex + "-" + indicey);
						if (jogo.terminou()) {
							if(jogo.getResultado()==1) {
								String nomeEsq = textField.getText();
								label.setText("O jogador " + nomeEsq + " venceu");
							} else if (jogo.getResultado()==2) { 
								String nomeDir = textField_1.getText();
								label.setText("jogador " + nomeDir + " venceu");
							}else if (jogo.getResultado()==3) {
								label.setText("ninguem venceu");
							} else {
								label.setText("maquina venceu");
							}
						}
					}
				});
			}
		}
	}
}

