
public class Retangulo {
	//public static void main(String[] args) {
		private double largura;
		private double comprimento;
		public Retangulo (double l, double c) {
			largura = l;
			comprimento = c;
		}
		public double calcularArea() {
			return largura*comprimento;
		}
		public void redimencionar(double fator) {
			largura = largura*fator;
			comprimento = comprimento*fator;
		}
	//}
}