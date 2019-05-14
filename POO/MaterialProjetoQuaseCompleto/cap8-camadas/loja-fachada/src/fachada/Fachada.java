package fachada;

import java.util.ArrayList;

import modelo.Prateleira;
import modelo.Produto;
import repositorio.Loja;

/**********************************
 * IFPB - Curso Superior de Tec. em Sist. para Internet
 * POO - Programação Orientada a Objetos
 * Prof. Fausto Ayres
 *
 */

public class Fachada {
	private static Loja loja = new Loja();
	private static int idprateleira=0;	//autoincremento


	public static Produto cadastrarProduto(String nome, double preco) throws  Exception{
		Produto p = loja.localizarProduto(nome);
		if (p!=null)
			throw new Exception("produto ja cadastrado:" + nome);
		//criar produto e adicionar na loja
		p = new Produto(nome,preco);
		loja.adicionar(p);
		return p;
	}

	public static Prateleira cadastrarPrateleira(double tam)
			throws  Exception{

		//criar prateleira e adicionar na loja
		idprateleira++;
		Prateleira p = new Prateleira(idprateleira, tam);	
		loja.adicionar(p);
		return p;
	}

	public static void inserirProdutoPrateleira(int id, String nome) throws  Exception {	
		Prateleira pt = loja.localizarPrateleira (id);
		if(pt == null) 
			throw new Exception("inclusao na prateleira - prateleira nao cadastrada:" + id);

		Produto p = loja.localizarProduto(nome);
		if(p == null)
			throw new Exception("inclusao na prateleira - produto nao cadastrado:" + nome);

		if(p.getPrateleira() != null)
			throw new Exception("inclusao na prateleira - produto ja tem prateleira:"+p.getPrateleira().getId());
		
		pt.adicionar(p); 	//relacionar produto e prateleira
	}

	public static void removerProdutoPrateleira(String nome) throws Exception{
		
		Produto p = loja.localizarProduto(nome);
		if(p == null)
			throw new Exception("remocao na prateleira - produto nao cadastrado:" + nome);

		if(p.getPrateleira() == null)
			throw new Exception("remocao na prateleira - produto nao tem prateleira:"+p.getPrateleira().getId());
	
		Prateleira pt = p.getPrateleira();
		pt.remover(p); 	//relacionar produto e prateleira

	
	}
	
	public static ArrayList<Produto> listarProdutos() {
		return loja.getProdutos();
	}

	public static void apagarProduto(String nome) throws Exception {
		Produto prod = loja.localizarProduto(nome);
		if (prod==null)
			throw new Exception("produto inexistente");
		
		loja.remover(prod);
		//remover da prateleira
		Prateleira prat = prod.getPrateleira();
		if(prat!=null) {
			prat.remover(prod);
			prod.setPrateleira(null);
		}
	}
	
	public static ArrayList<Prateleira> listarPrateleiras() {
		return loja.getPrateleiras();
	}

	public static ArrayList<Prateleira> listarPrateleirasVazias(){			
		ArrayList<Prateleira> aux = new  ArrayList<Prateleira>();
		
		for(Prateleira pt : loja.getPrateleiras())
			if(pt.getTotalProdutos()==0)
				aux.add(pt);
				
		return aux;
	}
	
	//nova consulta
	public static ArrayList<Prateleira> listarPrateleiras3Produtos(){			
		ArrayList<Prateleira> aux = new  ArrayList<Prateleira>();
		for(Prateleira pt : loja.getPrateleiras())
			if(pt.getTotalProdutos()==3)
				aux.add(pt);
				
		return aux;
	}
	
	public static ArrayList<Produto>  listarProdutosSemPrateleira(){		
		ArrayList<Produto> aux = new ArrayList<Produto>();
		for(Produto p : loja.getProdutos())
			if(p.getPrateleira()==null)
				aux.add(p);
		
		return aux;
	}

}//class
