package fachada;

import java.util.ArrayList;

import modelo.Pedido;
import modelo.Produto;
import repositorio.Restaurante;

/**********************************
 * IFPB - Curso Superior de Tec. em Sist. para Internet
 * POO - Programação Orientada a Objetos
 * Prof. Fausto Ayres
 *
 */

public class Fachada {
	private static Restaurante restaurante = new Restaurante();
	private static int idpedido=0;	//autoincremento


	public static Produto cadastrarProduto(String nome, double preco) throws  Exception{
		Produto p = restaurante.localizarProduto(nome);
		if (p!=null)
			throw new Exception("cadastrar produto: produto ja cadastrado:" + nome);
		
		//criar produto e adicionar na restaurante
		p = new Produto(nome,preco);
		restaurante.adicionar(p);
		return p;
	}

	public static Pedido abrirPedido(){
		idpedido++;
		Pedido p = new Pedido(idpedido);	
		restaurante.adicionar(p);
		return p;
	}

	public static void inserirProdutoPedido(String nome_cliente, String nome_produto) throws  Exception {	

		Cliente cli = restaurante.localizarCliente(nome_cliente);
		if(cli == null) 
			throw new Exception("inclusao na pedido - cliente nao cadastrado:" + nome_cliente);
	
		Pedido pedido = cli.obterPedidoAberto();
		if(pedido == null) 
			throw new Exception("inclusao na pedido - nao existe pedido aberto do cliente:");

		Produto produto = restaurante.localizarProduto(nome_produto);
		if(produto == null)
			throw new Exception("inclusao na pedido - produto nao cadastrado:" + nome);

		
		pedido.adicionar(produto); 	//relacionar produto e prateleira
	//	produto.adicionar(pedido);
	}

	public static void removerProdutoPedido(String nome) throws Exception{
		
		
	}
	
	public static ArrayList<Produto> listarProdutos() {
		return restaurante.getProdutos();
	}

	
	
	public static ArrayList<Pedido> listarPedidos() {
		return restaurante.getPrateleiras();
	}

	
	
	

}//class
