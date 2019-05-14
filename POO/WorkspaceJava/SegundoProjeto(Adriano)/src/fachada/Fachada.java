package fachada;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;
import java.util.TreeMap;

import modelo.Cliente;
import modelo.Combo;
import modelo.Pedido;
import modelo.Produto;
import repositorio.Restaurante;
import java.util.Collections;

/**********************************
 * IFPB - Curso Superior de Tec. em Sist. para Internet
 * POO - Programa��o Orientada a Objetos
 * Prof. Fausto Ayres
 *
 */

public class Fachada {
	private static Restaurante restaurante = new Restaurante();
	private static int idpedido=0;	//autoincremento
	private static int idproduto=0;


	public static Produto cadastrarProduto(String nome, double preco) throws  Exception{
		Produto p = restaurante.localizarProduto(nome);
		if (p!=null)
			throw new Exception("cadastrar produto: produto ja cadastrado:" + nome);
		//criar produto e adicionar no restaurante
		idproduto++;
		p = new Produto(nome, preco, idproduto);
		restaurante.adicionar(p);
		//Collections.sort(restaurante.getProdutos());
		return p;
	}


	public static Cliente cadastrarCliente(String telefone, String nome, String email, String endereco) throws  Exception{
		Cliente c = restaurante.localizarCliente(telefone);
		if (c!=null)
			throw new Exception("cadastrar cliente: cliente ja cadastrado:" + nome);
		//criar cliente e adicionar no restaurante
		c = new Cliente(telefone, nome, email, endereco);
		restaurante.adicionarCliente(c);
		return c;
	}


	public static Pedido abrirPedido(String telefone) throws Exception{
		Cliente c = restaurante.localizarCliente(telefone);
		if (c == null)
			throw new Exception("cadastrar cliente: cliente n�o cadastrado:" + telefone);
		Pedido p = restaurante.localizarPedidoCliente(telefone);
		if (p!=null)
			throw new Exception("cadastrar pedido: pedido ja aberto:" + telefone);
		idpedido++;
		p = new Pedido(idpedido);	
		c.addPedido(p);
		restaurante.adicionarPedido(p);
		return p;
	}


	public static Pedido consultarPedido(String telefone) {
		return restaurante.localizarPedidoCliente(telefone);
	}



	public static void adicionarProdutoPedido(String nome_cliente, int id) throws  Exception {	

		Cliente cli = restaurante.localizarCliente(nome_cliente);
		if(cli == null) 
			throw new Exception("inclusao na pedido - cliente nao cadastrado:" + nome_cliente);

		Pedido pedido = cli.getUltimoPedido();
		if(pedido == null) 
			throw new Exception("inclusao na pedido - nao existe pedido aberto do cliente:");

		Produto produto = restaurante.localizarProduto(id);
		if(produto == null)
			throw new Exception("inclusao na pedido - produto nao cadastrado:" + nome_cliente);


		pedido.adicionar(produto); 	//relacionar produto e prateleira
		//	produto.adicionar(pedido);
	}

	public static void removerProdutoPedido(String telefone, int id) throws Exception{
		Cliente c = restaurante.localizarCliente(telefone);
		if (c==null)
			throw new Exception("cadastrar cliente: cliente n�o cadastrado:" + telefone);
		Pedido pedido = c.getUltimoPedido();
		if(pedido == null) 
			throw new Exception("inclusao na pedido - nao existe pedido aberto do cliente:");
		Produto produto = restaurante.localizarProduto(id);
		if(produto == null)
			throw new Exception("inclusao na pedido - produto nao cadastrado:" + telefone);

		pedido.remover(produto);
	}


	public static void fecharPedido(String telefone, String entregador) throws Exception{
		Cliente c = restaurante.localizarCliente(telefone);
		if (c==null)
			throw new Exception("cadastrar cliente: cliente n�o cadastrado:" + telefone);
		c.getUltimoPedido().setFechado(true);		
	}

	
	public static void fecharPedido(String telefone) throws Exception{
		Cliente c = restaurante.localizarCliente(telefone);
		if (c==null)
			throw new Exception("cadastrar cliente: cliente n�o cadastrado:" + telefone);
		c.getUltimoPedido().setFechado(true);		
	}
	

	public static void cancelarPedido(String telefone) throws Exception{
		Pedido p = restaurante.localizarPedidoCliente(telefone);
		if(p == null) 
			throw new Exception("cancelamento de pedido: pedido inexistente");
		restaurante.remover(p);
	}

	public static double calcularArrecadacao (int dia) {
		double total = 0.0;
		ArrayList<Pedido> listaP = restaurante.getPedidos();
		for (Pedido p : listaP) {
			if (p.getData().getDayOfMonth() == dia)
				total += p.getTotal();
		}
		return total;
	}


	public static TreeMap<String, Cliente> listarClientes() {
		return restaurante.getClientes();
	}


	public static ArrayList<Produto> listarProdutos(String produto) {
		ArrayList<Produto> produtos = new ArrayList<>();
		if (produto.equals(""))
			produtos = restaurante.getProdutos();
		else
			for (Produto p : restaurante.getProdutos())
				if(p.getDecricao().contains(produto))
					produtos.add(p);
		produtos.sort(new Comparator<Produto>() {
			public int compare(Produto produto, Produto outroProduto) {
				return produto.getNome().compareTo(outroProduto.getNome());
			}
		});
		return produtos;
	}


	public static ArrayList<Produto> listarProdutos() {
		return restaurante.getProdutos();
	}
	
	
	
	public static ArrayList<Pedido> listarPedidos(){
		return restaurante.getPedidos();
	}
	
	
	public static ArrayList<Pedido> listarPedidos(String telefone) throws Exception {
		Cliente c = restaurante.localizarCliente(telefone);
		if (c==null)
			throw new Exception("Cliente n�o localizado");
		else
		return c.getPedido();
	}


	public static void enviarPedido(String telefone, String senha) throws Exception {
		Pedido p = restaurante.localizarPedidoClientePdf(telefone);
		if (p == null)
			throw new Exception("Nota n�o eviada");
		System.out.println(p);
		//Pdf pdf = new Pdf(p);
	}


	public static Produto criarCombo(String nome, List<Integer> listaid) {
		List<Produto> produtos = restaurante.getProdutos();
		ArrayList<Produto> ps = new ArrayList<Produto>();
		double preco = 0;
		for (Integer id: listaid) {
			for (Produto p: produtos) {
				if (p.getId() == id) {
					ps.add(p);
					preco += p.getPreco();
				}
			}
		}
		
		int ultimo = restaurante.getProdutos().size();
	
		Combo combo = new Combo(nome, preco, ultimo ,ps );
		return combo;
	}


	public static void excluirPedido(int id) throws Exception {
		ArrayList<Pedido> pe = restaurante.getPedidos();
		for (Pedido i : pe) {
			if(i.getId() == id) {
				if(i.isFechado() == false) {
					throw new Exception("Pedido aberto, n�o pode ser excluido!");
				}else
					restaurante.remover(i);
			}
		}
	}
}