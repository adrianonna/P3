import java.util.*; // a classe Scanner
import java.math.*;

/*
public class Ola {
	public  static  void  main(String[]  args)  {
	System.out.println("Ola para  todos");
	}
}
 */

	public class Ola {
		private static Scanner teclado;
		private static String[] nomes;

		public static void main(String[] args){
			int qtde=0;
			teclado = new Scanner(System.in);
			
			String nome;
			System.out.println("Qual é o seu nome? ");
			nome = teclado.nextLine();
			
			
			System.out.println("Digite sua senha: ");
			String senha = teclado.nextLine();
							
				//Se a senha for ifpb, entra no if.
				if (!senha.equals("ifpb")){
					System.out.println("Senha errada, tente novamente: ");
					senha = teclado.nextLine();
					while (senha != "ifpb" && senha != ".s41R."){
						System.out.println("Senha errada, tente novamente: ");
						senha = teclado.nextLine();	
					}		
					System.out.println("Qual sua idade? ");
					String idade = teclado.nextLine();
						
					//converter string armazenada em variável em inteiro
					int idade2 = Integer.parseInt(idade);
					if (idade2 > 18){
						System.out.println("Você é maior que 18 anos!");
							
						System.out.println("Bom dia, " + nome + "!");
						System.out.println("Vc tem:  " + idade + " anos!");
						System.out.println("");
							
						System.out.println("Qual seu telefone? ");
						Long telefone = teclado.nextLong();
						System.out.println("Seu telefone é " + telefone + " !");	
					}
					else
						System.out.println("Você não é maior que 18 anos");
					
				qtde=qtde + 1;
				if (qtde == 5) {
					System.out.println("Muitas tentativas. Saindo");
					senha = ".s41R.";
				}
			}
			
			System.out.println("Cadastrar quantos? ");
			int n= teclado.nextInt(); //defino qual o tamanho do array de nomes.
			nomes = new String[n]; //crio o array de strings no tamanho de "n"
//			percorro o array, atribuindo valor a cada indice.
			for (int i=0; i<=nomes.length; i++) {
				System.out.println("Nome: ");
				nomes[i]= teclado.nextLine();
			}
			
			for(String b: nomes) {
				System.out.println(b);
				System.out.println("Entrou");
			}
			
			System.out.println(nomes.length);
		}
	}



	
