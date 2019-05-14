
public class Motor {
	private String nome;
	private double potencia;
	
	public Motor(String nome, double pontencia) {
		this.nome = nome;
		this.potencia = potencia;
	}
	
	public String getNome() {
		return nome;
	}
	public void setNome(String nome) {
		this.nome = nome;
	}
	public double getPotencia() {
		return potencia;
	}
	public void setPotencia(double potencia) {
		this.potencia = potencia;
	}
	public String toString() {
		return "Motor [nome=" + nome + ", potencia=" + potencia + "]";
	}
}
