package repositorio;
/**********************************
 * IFPB - Curso Superior de Tec. em Sist. para Internet
 * Programação Orientada a Objetos
 * Prof. Fausto Maranhão Ayres
 **********************************/
import java.util.ArrayList;

import modelo.Prateleira;
import modelo.Produto;

public class Loja {
	private ArrayList<Produto> produtos = new ArrayList<Produto>();
	private ArrayList<Prateleira> prateleiras = new ArrayList<Prateleira>();


	public void adicionar(Produto p){
		produtos.add(p);
	}
	public void remover(Produto p){
		produtos.remove(p);
	}

	public Produto localizarProduto(String nome){
		for(Produto p : produtos){
			if(p.getNome().equals(nome))
				return p;
		}
		return null;
	}


	public void adicionar(Prateleira p){
		prateleiras.add(p);
	}
	public void remover(Prateleira p){
		prateleiras.remove(p);
	}

	public Prateleira localizarPrateleira(int id){
		for(Prateleira p : prateleiras){
			if(p.getId()==id)
				return p;
		}
		return null;
	}

	public ArrayList<Produto> getProdutos() {
		return produtos;
	}

	public ArrayList<Prateleira> getPrateleiras() {
		return prateleiras;
	}

	public int getTotalProdutos(){
		return produtos.size();
	}
	public int getTotalPrateleiras(){
		return prateleiras.size();
	}



}

