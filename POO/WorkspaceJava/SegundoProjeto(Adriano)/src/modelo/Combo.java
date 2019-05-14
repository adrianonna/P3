package modelo;

import java.util.ArrayList;

public class Combo extends Produto {
	private ArrayList<Produto> componentes = new ArrayList<>();

	public Combo(String nome, double preco, int id, ArrayList<Produto> ps) {
		super(nome, preco, id);
		this.componentes = ps;
	}
	
	
	public void adicionarComponente(Produto p) {
		componentes.add(p);
	}


	public ArrayList<Produto> getComponentes() {
		return componentes;
	}

	
	public double getPreco() {
		return super.getPreco()*0.9;
	}
	
	
	@Override
	public String toString() {
		return "Combo [componentes=" + componentes + " Preço= "+ getPreco() + "]";
	}	
}
