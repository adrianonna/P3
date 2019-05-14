package aplicacao_console;
/**********************************
 * IFPB - Curso Superior de Tec. em Sist. para Internet
 * Programação Orientada a Objetos
 * Prof. Fausto Maranhão Ayres
 **********************************/


import java.util.ArrayList;

import fachada.Fachada;
import modelo.Prateleira;
import modelo.Produto;

public class Teste1 {
	public Teste1() {
		cadastrar();
		atualizar();
		//excluir();
		listar();
		//consultar();
	}

	public void cadastrar(){
		try {	
			Produto p;
			Prateleira pt;
			p = Fachada.cadastrarProduto("arroz", 3.0);
			p = Fachada.cadastrarProduto("feijao", 5.0);
			p = Fachada.cadastrarProduto("leite", 2.0);
			p = Fachada.cadastrarProduto("carne", 30.0);
			p = Fachada.cadastrarProduto("oleo", 10.0);
			pt = Fachada.cadastrarPrateleira(200);
			pt = Fachada.cadastrarPrateleira(300);
			pt = Fachada.cadastrarPrateleira(400);	
			System.out.println("cadastro concluido");
		}catch (Exception e) {
			System.out.println(e.getMessage());
		}
	}


	public void atualizar(){
		try{
			Fachada.inserirProdutoPrateleira(1, "arroz");
			Fachada.inserirProdutoPrateleira(1, "feijao");
			Fachada.inserirProdutoPrateleira(2, "leite");	
			//Fachada.removerProdutoPrateleira("leite");
			//Fachada.removerProdutoPrateleira("leite");
			System.out.println("atualizacao concluido");
		}catch (Exception e) {
			System.out.println("==>"+ e.getMessage());
		}
	}

	public static void excluir(){
		try {
			Fachada.apagarProduto("arroz"); 
			System.out.println("exclusao concluido");
		}catch (Exception e) {
			System.out.println("==>"+ e.getMessage());
		}
		//-----------------------------	
	}

	public void listar(){
		String texto;
		ArrayList<Produto> lista1 = Fachada.listarProdutos();
		texto = "Listagem de produtos: \n";
		if (lista1.isEmpty())
			texto += "não tem produto cadastrado\n";
		else 	
			for(Produto p: lista1) 
				texto +=  p + "\n"; 
		System.out.println(texto);


		ArrayList<Prateleira> lista2 = Fachada.listarPrateleiras();
		texto = "Listagem de prateleiras: \n";
		if (lista2.isEmpty())
			texto += "não tem prateleira cadastrada\n";
		else 
			for(Prateleira p: lista2) 
				texto +=  p + "\n"; 
		System.out.println(texto);
	}

	public void consultar(){
		ArrayList<Prateleira> lista = Fachada.listarPrateleirasVazias();
		String texto = "Prateleiras vazias: \n";
		if (lista.isEmpty())
			texto += "não tem prateleira vazia\n";
		else 	
			for(Prateleira p: lista) 
				texto +=  "id="+ p.getId() + "\n"; 					
		System.out.println(texto);



		ArrayList<Prateleira> lista2 = Fachada.listarPrateleiras3Produtos();
		texto = "Prateleiras com 3 produtos: \n";
		if (lista2.isEmpty())
			texto += "não tem prateleira\n";
		else 	
			for(Prateleira p: lista2) 
				texto +=  "id="+ p.getId() + "\n"; 					
		System.out.println(texto);



		ArrayList<Produto> produtos = Fachada.listarProdutosSemPrateleira();
		System.out.println("Listagem de produtos sem prateleira");
		for(Produto p: produtos)
			System.out.println(p.getNome());
	}



	//  ***********************************************
	public static void main (String[] args)   
	//  ***********************************************
	{
		new Teste1();
	}

}
