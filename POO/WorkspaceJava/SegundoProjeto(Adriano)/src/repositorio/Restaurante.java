package repositorio;
/**********************************
 * IFPB - Curso Superior de Tec. em Sist. para Internet
 * Programação Orientada a Objetos
 * Prof. Fausto Maranhão Ayres
 **********************************/
import java.util.ArrayList;
import java.util.TreeMap;

import modelo.Cliente;
import modelo.Pedido;
import modelo.Produto;

public class Restaurante {
	private ArrayList<Produto> produtos = new ArrayList<Produto>();
	private ArrayList<Pedido> pedidos = new ArrayList<Pedido>();
	private TreeMap<String, Cliente> clientes = new TreeMap<>();


	public void adicionar(Produto p){
		produtos.add(p);
	}
	
	public void remover(Produto p){
		produtos.remove(p);
	}

	public void adicionarCliente(Cliente c){
		clientes.put(c.getTelefone(), c);
	}

	public void adicionarPedido(Pedido p){
		pedidos.add(p);
	}
	public void remover(Pedido p){
		pedidos.remove(p);
	}

	public ArrayList<Produto> getProdutos() {
		return produtos;
	}

	public ArrayList<Pedido> getPedidos() {
		return pedidos;
	}

	public int getTotalProdutos(){
		return produtos.size();
	}
	public int getTotalPedidos(){
		return pedidos.size();
	}

	public TreeMap<String, Cliente> getClientes() {
		return clientes;
	}


	//cadastrar produto
	public Produto localizarProduto(String nome){
		for(Produto p : produtos){
			if(p.getNome().equals(nome))
				return p;
		}
		return null;
	}

	//adicionarProdutoPedido
	public Produto localizarProduto(int id){
		for(Produto p : produtos){
			if(p.getId() == id)
				return p;
		}
		return null;
	}


	public Cliente localizarCliente(String telefone){
		for(Cliente c : clientes.values()){
			if(c.getTelefone().equals(telefone))
				return c;
		}
		return null;
	}


	public Pedido localizarPedidoClientePdf(String telefone){
		int ultimo = 0;
		for(Cliente c : clientes.values()){
			if(c.getTelefone().equals(telefone)) {
				ultimo= c.getPedido().size()-1;
				return c.getPedido().get(ultimo);
			}
		}
		return null;
	}

	public Pedido localizarPedidoCliente(String telefone){
		for(Cliente c : clientes.values()){
			if(c.getTelefone().equals(telefone))
				return c.getUltimoPedido();
		}
		return null;
	}

	public Pedido localizarPedido(int id){
		for(Pedido p : pedidos){
			if(p.getId()==id)
				return p;
		}
		return null;
	}

}

