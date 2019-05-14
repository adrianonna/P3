import java.util.Random;

public class JogoDaVelha {
	private static Random r = new Random();
	private String jogador1;
	private String jogador2;
	private String [][] tabuleiro = new String[3][3];
	private int linha;
	private int coluna;
	private int qtde;
	private int ultimoJogador;


	public JogoDaVelha(String jogador1, String jogador2) {
		this.jogador1 = jogador1;
		this.jogador2 = jogador2;
	}

	public JogoDaVelha(String jogador1) {
		this.jogador1 = jogador1;
	}

	public boolean jogarJogador(int numeroJogador, int l, int c) {
		linha = l;
		coluna = c;
		if (tabuleiro[linha][coluna] != null) {
			return false;
		}
		if (numeroJogador == 1) {
			tabuleiro[linha][coluna] = "X";
			qtde += 1;
			ultimoJogador = numeroJogador;
			for (int i = 0; i < 3; i++){
				System.out.print("|  ");
				for (int j = 0; j < 3; j++) {
					System.out.print(tabuleiro[i][j] + "  |  ");
				}
				System.out.println();
			}
			return true;
		}
		else {
			tabuleiro[linha][coluna] = "O";
			qtde += 1;
			ultimoJogador = numeroJogador;
			for (int i = 0; i < 3; i++){
				System.out.print("|  ");
				for (int j = 0; j < 3; j++) {
					System.out.print(tabuleiro[i][j] + " | ");
				}
				System.out.println();
			}
			return true;
		}
	}

	public void jogarMaquina() {
		boolean loop = true;
		while(loop){
			ultimoJogador = 2;
			int lin = r.nextInt(3);
			int col = r.nextInt(3);
			System.out.println(linha);
			System.out.println(coluna);

			if((tabuleiro[lin][col]) == null){
				tabuleiro[lin][col] = "O";
				linha = lin;
				coluna = col;
				loop = false;
			}
			for (int i = 0; i < 3; i++){
				System.out.print("|  ");
				for (int j = 0; j < 3; j++) {
					System.out.print(tabuleiro[i][j] + " | ");
				}
				System.out.println();
			}
		}
	}
	
	public int getUltimoJogador() {
		return ultimoJogador;
	}

	public int getUltimaLinha() {
		return linha;
	}

	public int getUltimaColuna() {
		return coluna;
	}

	public boolean terminou() {
		if(tabuleiro[0][0] == "X" && tabuleiro[1][0] == "X" && tabuleiro [2][0] == "X"){
			return true;
		}
		else if(tabuleiro[0][1] == "X" && tabuleiro[1][1] == "X" && tabuleiro[2][1] == "X"){
			return true;
		}
		else if(tabuleiro[0][2] == "X" && tabuleiro[1][2] == "X" && tabuleiro[2][2] == "X"){
			return true;
		}
		else if(tabuleiro[0][0] == "X" && tabuleiro[0][1] == "X" && tabuleiro[0][2] == "X"){
			return true;
		}
		else if(tabuleiro[1][0] == "X" && tabuleiro[1][1] == "X" && tabuleiro[1][2] == "X"){
			return true;
		} 
		else if(tabuleiro[2][0] == "X" && tabuleiro[2][1] == "X" && tabuleiro[2][2] == "X"){
			return true;
		}
		else if(tabuleiro[0][0] == "X" && tabuleiro[1][1] == "X" && tabuleiro[2][2] == "X"){
			return true;
		}
		else if(tabuleiro[0][2] == "X" && tabuleiro[1][1] == "X" && tabuleiro[2][0] == "X"){
			return true;
		}
		else if(tabuleiro[0][0] == "O" && tabuleiro[1][0] == "O" && tabuleiro [2][0] == "O"){
			return true;
		}
		else if(tabuleiro[0][1] == "O" && tabuleiro[1][1] == "O" && tabuleiro[2][1] == "O"){
			return true;
		}
		else if(tabuleiro[0][2] == "O" && tabuleiro[1][2] == "O" && tabuleiro[2][2] == "O"){
			return true;
		}
		else if(tabuleiro[0][0] == "O" && tabuleiro[0][1] == "O" && tabuleiro[0][2] == "O"){
			return true;
		}
		else if(tabuleiro[1][0] == "O" && tabuleiro[1][1] == "O" && tabuleiro[1][2] == "O"){
			return true;
		}
		else if(tabuleiro[2][0] == "O" && tabuleiro[2][1] == "O" && tabuleiro[2][2] == "O"){
			return true;
		}
		else if(tabuleiro[0][0] == "O" && tabuleiro[1][1] == "O" && tabuleiro[2][2] == "O"){
			return true;
		}
		else if(tabuleiro[0][2] == "O" && tabuleiro[1][1] == "O" && tabuleiro[2][0] == "O"){
			return true; 
		}
		else if (qtde == 9) { 
			return true;
		}
		return false;

	}

	public int getResultado() {
		//Checa X verticalmente
		if(tabuleiro[0][0] == "X" && tabuleiro[1][0] == "X" && tabuleiro [2][0] == "X"){
			return 1;
		}
		else if(tabuleiro[0][1] == "X" && tabuleiro[1][1] == "X" && tabuleiro[2][1] == "X"){
			return 1;
		}
		else if(tabuleiro[0][2] == "X" && tabuleiro[1][2] == "X" && tabuleiro[2][2] == "X"){
			return 1;
		}

		//Checa X horizontalmente
		else if(tabuleiro[0][0] == "X" && tabuleiro[0][1] == "X" && tabuleiro[0][2] == "X"){
			return 1;
		}
		else if(tabuleiro[1][0] == "X" && tabuleiro[1][1] == "X" && tabuleiro[1][2] == "X"){
			return 1;
		} 
		else if(tabuleiro[2][0] == "X" && tabuleiro[2][1] == "X" && tabuleiro[2][2] == "X"){
			return 1;
		}

		//Checa X diagonalmente
		else if(tabuleiro[0][0] == "X" && tabuleiro[1][1] == "X" && tabuleiro[2][2] == "X"){
			return 1;
		}
		else if(tabuleiro[0][2] == "X" && tabuleiro[1][1] == "X" && tabuleiro[2][0] == "X"){
			return 1;
		}

		//Checa O verticalmente
		else if(tabuleiro[0][0] == "O" && tabuleiro[1][0] == "O" && tabuleiro [2][0] == "O"){
			return 2;
		}
		else if(tabuleiro[0][1] == "O" && tabuleiro[1][1] == "O" && tabuleiro[2][1] == "O"){
			return 2;
		}
		else if(tabuleiro[0][2] == "O" && tabuleiro[1][2] == "O" && tabuleiro[2][2] == "O"){
			return 2;
		}	

		//Checa O horizontalmente
		else if(tabuleiro[0][0] == "O" && tabuleiro[0][1] == "O" && tabuleiro[0][2] == "O"){
			return 2;
		}
		else if(tabuleiro[1][0] == "O" && tabuleiro[1][1] == "O" && tabuleiro[1][2] == "O"){
			return 2;
		}
		else if(tabuleiro[2][0] == "O" && tabuleiro[2][1] == "O" && tabuleiro[2][2] == "O"){
			return 2;
		}

		//Checa O diagonalmente
		else if(tabuleiro[0][0] == "O" && tabuleiro[1][1] == "O" && tabuleiro[2][2] == "O"){
			return 2;
		}
		else if(tabuleiro[0][2] == "O" && tabuleiro[1][1] == "O" && tabuleiro[2][0] == "O"){
			return 2; 
		}

		return 3;
	}
}

