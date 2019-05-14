import java.util.*;

public class Conta {
	private String nome;
	private String numero;
	private float saldo;
	private static Scanner teclado;

	public Conta(String nome, String numero){
		this.nome = nome;
		this.numero = numero;
	}

	public void creditar(float valor){
		//System.out.println("Creditado " + valor + " na conta: " + this.nome);
		this.saldo += valor;
	}

	public void debitar(float valor) {
		teclado = new Scanner(System.in); //transforma a variavel teclado em objeto do classe Scanner
        float aux;
        aux = this.saldo - valor;
		while (aux < 0) {
            System.out.println("Saldo insuficiente!");
            System.out.println("Digite outro valor a ser debitado!");
            valor = teclado.nextFloat();
            aux = this.saldo - valor;
		}
		this.saldo -= valor;
        //System.out.println("Saldo atualizado!");
        //System.out.println("Novo saldo: " + this.saldo + " Conta: " + this.nome);
	}

	public void transferir(float valor, Conta destino) {
	    float aux;
        if (this.numero == destino.numero) {
            System.out.println("Nao e possovel transferir para a mesma coisa");
        }
        else{
            aux = this.saldo - valor;
            while (aux < 0) {
                System.out.println("Saldo insuficiente!");
                System.out.println("Digite outro valor a ser transferido!");
                valor = teclado.nextFloat();
                aux = this.saldo - valor;
            }
            this.saldo -= valor;
            destino.creditar(valor);
            //System.out.println("Transferencia de " + this.nome + " para " + destino.nome + " realizada com sucesso!");
            System.out.println("Conta: " + this.nome + ", saldo: "+ this .saldo + "\nConta destino: " + destino);
        }
	}

    public String toString() {
        return "Nome: " + nome + ", número: " + numero + ", saldo: " + saldo;
    }
}


