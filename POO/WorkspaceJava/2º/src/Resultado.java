
public class Resultado {

	public static void main(String[] args) {
		Retangulo r1 = new Retangulo(5, 30); //crio r1 do tipo Retangulo(chamando do outro arquivo)
		System.out.println("area: "+ r1.calcularArea());
		
		System.out.println("perímetro: "+ r1.calcularPerimetro());
	
		System.out.println(r1.getComprimento());
		System.out.println(r1.getLargura());
		r1.redimencionar(10);
		System.out.println(r1.getComprimento());
		System.out.println(r1.getLargura());
	}
}
