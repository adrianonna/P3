package aplicacao_console;
/**********************************
 * IFPB - Curso Superior de Tec. em Sist. para Internet
 * Programação Orientada a Objetos
 * Prof. Fausto Maranhão Ayres
 **********************************/


import java.util.ArrayList;

import fachada.Fachada;
import modelo.Pedido;
import modelo.Produto;

public class Teste1 {
	public Teste1() {
		cadastrar();
		listar();
	}

	public void cadastrar(){
		try {	
			Produto p;
			Pedido pt;
			p = Fachada.cadastrarProduto("arroz", 3.0);
			System.out.println("produto cadastrado:"+p.getNome());
			
			p = Fachada.cadastrarProduto("feijao", 5.0);
			p = Fachada.cadastrarProduto("leite", 2.0);
			p = Fachada.cadastrarProduto("carne", 30.0);
			p = Fachada.cadastrarProduto("oleo", 10.0);
			pt = Fachada.abrirPedido();
			pt = Fachada.abrirPedido();
			pt = Fachada.abrirPedido();	
			System.out.println("cadastro concluido");
		}catch (Exception e) {
			System.out.println(e.getMessage());
		}
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


		ArrayList<Pedido> lista2 = Fachada.listarPedidos();
		texto = "Listagem de prateleiras: \n";
		if (lista2.isEmpty())
			texto += "não tem prateleira cadastrada\n";
		else 
			for(Pedido p: lista2) 
				texto +=  p + "\n"; 
		System.out.println(texto);
	}




	//  ***********************************************
	public static void main (String[] args)   
	//  ***********************************************
	{
		new Teste1();
	}

}
