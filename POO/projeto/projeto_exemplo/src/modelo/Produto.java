package modelo;
/**********************************
 * IFPB - Curso Superior de Tec. em Sist. para Internet
 * Programação Orientada a Objetos
 * Prof. Fausto Maranhão Ayres
 **********************************/

public class Produto {
		private String nome;
		private double preco;

		
		public Produto(String nome,  double preco) {
			super();
			this.nome = nome;
			this.preco = preco;
		}
		public String getNome() {
			return nome;
		}
		public void setNome(String nome) {
			this.nome = nome;
		}
		public double getPreco() {
			return preco;
		}
		public void setPreco(double preco) {
			this.preco = preco;
		}		
		
		//---------------------------------------
		@Override
		public String toString() {
			return "Produto [" + (nome != null ? "nome=" + nome + ", " : "")
					+ "preco=" + preco + ", "
					+ "]";
		}
		
	
}
