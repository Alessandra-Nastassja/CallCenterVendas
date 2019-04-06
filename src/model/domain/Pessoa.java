package model.domain;

import util.ValidacaoException;

public class Pessoa {
	private Integer codigo;
	private String email;
	private String nome;
	
	/* Constructor */
	
	public Pessoa() {
		super();
	}
	
	public void valida() throws ValidacaoException{
		if(nome == null || nome.equals("")) {
			throw new ValidacaoException("Preencha corretamente o campo de nome");
		}
	}
	
	public Pessoa(Integer codigo, String email, String nome) {
		super();
		this.codigo = codigo;
		this.email = email;
		this.nome = nome;
	}

	/* Getters and Setters */
	
	public Integer getCodigo() {
		return codigo;
	}

	public void setCodigo(Integer codigo) {
		this.codigo = codigo;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}
	
	
	
	/* Alt + Shift + S = Abrir gerador de código */

	
}
