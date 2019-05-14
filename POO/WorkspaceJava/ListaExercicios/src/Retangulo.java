public class Retangulo {
		private double largura;
		private double comprimento;
		public Retangulo (double l, double c) {
			largura = l;
			comprimento = c;
		}
		
		//criar metodos get e set para acessar os valores do objeto/class
		
		public double getLargura() {
			return this.largura;
		}
		
		public double getComprimento() {
			return this.comprimento;
		}
		
		public double calcularArea() {
			return largura*comprimento;
		}
		
		//lista, exercício 17
		public boolean equivalente(Retangulo outro) {
			return this.calcularArea() == outro.calcularArea(); 
		}
		
		//lista, exercicio 18
		public Retangulo clonar() {
			return new Retangulo(this.largura, this.comprimento);
		}
		
		public void redimencionar(double fator) {
			largura = largura*fator;
			comprimento = comprimento*fator;
		}
		public double calcularPerimetro() {
			return (largura*2) + (comprimento*2);
		}

		public String toString() {
			return "Retangulo [largura=" + largura + ", comprimento=" + comprimento + ", area=" + this.calcularArea() + "]";
		}
		
		
		

}
