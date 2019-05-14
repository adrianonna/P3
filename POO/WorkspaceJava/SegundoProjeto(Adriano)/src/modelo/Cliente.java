package modelo;

import java.util.ArrayList;

public class Cliente {
	private String telefone;
	private String nome;
	private String email;
	private String endereco;
	private ArrayList<Pedido> pedidos = new ArrayList<Pedido>();


	public Cliente(String telefone, String nome, String email, String endereco) {
		super();
		this.telefone = telefone;
		this.nome = nome;
		this.email = email;
		this.endereco = endereco;
	}


	public Pedido getUltimoPedido() {
		if (pedidos.isEmpty())
			return null;
		int tam = pedidos.size()-1;
		Pedido p = pedidos.get(tam);
		//entra na condi��o se o pedido estiver aberto, ou seja igual a false
		if(p.isFechado() == false) //fechado = true pq ta fechado
			return p;
		return null;	
	}
	
	
	public String getTelefone() {
		return telefone;
	}
	public void setTelefone(String telefone) {
		this.telefone = telefone;
	}
	public String getNome() {
		return nome;
	}
	public void setNome(String nome) {
		this.nome = nome;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getEndereco() {
		return endereco;
	}
	public void setEndereco(String endereco) {
		this.endereco = endereco;
	}
	public ArrayList<Pedido> getPedido() {
		return pedidos;
	}
	public void addPedido(Pedido p) {
		pedidos.add(p);
	}
	
	
	@Override
	public String toString() {
		return "Cliente [telefone=" + telefone + ", nome=" + nome + ", email=" + email + ", endereco=" + endereco
				+ ", pedido=" + pedidos + "]";
	}
















}
