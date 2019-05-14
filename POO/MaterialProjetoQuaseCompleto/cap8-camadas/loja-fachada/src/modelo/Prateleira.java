package modelo;
/**********************************
 * IFPB - Curso Superior de Tec. em Sist. para Internet
 * Programa��o Orientada a Objetos
 * Prof. Fausto Maranh�o Ayres
 **********************************/
import java.util.ArrayList;


public class Prateleira {
	private int id;
	private double tamanho;
	private ArrayList<Produto> produtos = new ArrayList<Produto>();

	public Prateleira(int id, double t) {
		super();
		this.id = id;
		this.tamanho = t;
	}
	public void adicionar(Produto p){
		produtos.add(p);
		p.setPrateleira(this); //est� definindo esta prateleira para ser a pratelerira do produto passado por par�metro
	}
	public void remover(Produto p){
		produtos.remove(p);
		p.setPrateleira(null); //da mesma forma que define para esta referenciando ela mesmo, tbm define como fazia
	}

	public Produto localizar(String nome){ //fun��o do tipo Produto pq retorna p que � do tipo Produto
		for(Produto p : produtos){
			if(p.getNome().equals(nome))
				return p;
		}
		return null;
	}
	

	public int getTotalProdutos(){
		return produtos.size();
	}

	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public double getPesoMaximo() {
		return tamanho;
	}
	public void setPesoMaximo(double t) {
		this.tamanho = t;
	}
	

	@Override
	public String toString() {
		String texto = "Prateleira [id=" + id + ", tamanho=" + tamanho ;
		texto += ", produtos:";
		if (produtos.isEmpty())
			texto += " vazia";
		else 	
			for(Produto p: produtos) 
				texto += " " + p.getNome() ;

		return texto + "]";
	}


}
	


