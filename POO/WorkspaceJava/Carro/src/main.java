public class main {

	public static void main(String[] args) {
		Motor m1 = new Motor("zetec", 1.0);
		Motorista ma1 = new Motorista("João");
		Carro c1 = new Carro("AAA1234", m1, ma1);
		
		m1.setPotencia(1.4);
		ma1.setNome("Jose");
		System.out.println(c1);
		
		Motor m2 = new Motor("fire", 2.0);
		c1.setMotor(m2);
		System.out.println(c1);
		
		Carro c2 = new Carro("XYZ2000", m1, ma1);
		
		System.out.println(c1);
		System.out.println(c2);
	}
}
