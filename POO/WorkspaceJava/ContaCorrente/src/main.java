public class main {

	public static void main(String[] args) {
		Conta c1, c2;
		c1 = new Conta("Adriano", "101");
		c1.creditar(500);
		c1.debitar(600);
		
		c2 = new Conta("Ada", "102");
		c1.transferir(50, c2);
		
	}

}
