
public class _17_1 { //retangulo
	public static void main(String [] args) {
		Retangulo r1, r2, r3;
		r1= new Retangulo(10, 5);
		r2= new Retangulo(25, 2);
		r3= new Retangulo(10, 2);
		System.out.println(r1.equivalente(r2) );// true
		System.out.println(r2.equivalente(r1) );// true
		System.out.println(r1.equivalente(r3) );// false 
	}
}


