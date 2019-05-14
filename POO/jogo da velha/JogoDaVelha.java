
public class JogoDaVelha {
	private String nome1;
	private String nome2;
	private String[][] matriz = new String[3][3];
	private boolean fim=false;
	private int contjogada;
	private String historico="";
	private int resultado;
	
	//....
	
	public JogoDaVelha(String nome1, String nome2) {
		this.nome1 = nome1;
		this.nome2 = nome2;
		historico += "jogadores:" + nome1 + " contra " +nome2;
		for(int i=0; i < 3; i++)
			for(int j=0; j < 3; j++)
				matriz[i][j] = "-";
	}
	public JogoDaVelha(String nome1) {
		this.nome1 = nome1;
		this.nome2 = "maquina";
		historico += "jogadores:" + nome1 + " contra " +nome2;
		for(int i=0; i < 3; i++)
			for(int j=0; j < 3; j++)
				matriz[i][j] = "-";
	}
	
	public boolean jogarJogador(int numj, int lin, int col) {
		return false;
	}
	
	public boolean terminou() {
		
		
	}
	
	public int getResultado() {
		
		
		
	}
}
