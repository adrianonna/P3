
public class _18_1 {
	public static void main(String [] args) {
		 Retangulo r1, r2;
		r1= new Retangulo(9, 5);
		System.out.println(r1); // 9 e 5
		r2 = r1.clonar(); //faz uma cópia do objeto
		//r2 = new Retangulo(r1.getLargura(), r1.getComprimento()); //metodo clonar de forma mais "direta"
		System.out.println(r2); // 9 e 5
	}	
}
