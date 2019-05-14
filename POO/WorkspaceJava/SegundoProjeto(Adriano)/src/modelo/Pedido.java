package modelo;
import java.time.LocalDateTime;
/**********************************
 * IFPB - Curso Superior de Tec. em Sist. para Internet
 * Programação Orientada a Objetos
 * Prof. Fausto Maranhão Ayres
 **********************************/
import java.util.ArrayList;


public class Pedido {
	private int id;
	private LocalDateTime data = LocalDateTime.now();
	private double total;
	private String entregador;
	private boolean fechado = true;
	
	private ArrayList<Produto> produtos = new ArrayList<Produto>();
	private Cliente cliente;
	
	
	public double getTotal() {
		for (Produto p : produtos) {
			total += p.getPreco();
		}
		return total;
	}
	public void setTotal(double total) {
		this.total = total;
	}
	public LocalDateTime getData() {
		return data;
	}

	public boolean isFechado() {
		return fechado;
	}
	public void setFechado(boolean fechado) {
		this.fechado = fechado;
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
	
	public Pedido(int id) {
		super();
		this.id = id;
		setFechado(false);
	}
	
	
	public void adicionar(Produto p){
		produtos.add(p);
	}
	public void remover(Produto p){
		produtos.remove(p);
	}
	public Produto localizar(String nome){
		for(Produto p : produtos){
			if(p.getNome().equals(nome))
				return p;
		}
		return null;
	}
	
	@Override
	public String toString() {
		String texto = "Pedido [id=" + id  ;
		texto += ", produtos:";
		if (produtos.isEmpty())
			texto += " vazia";
		else 	
			for(Produto p: produtos) 
				texto += " " + p.getNome() ;

		return texto + "]";
	}


}
	


