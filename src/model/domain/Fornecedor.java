package model.domain;

import util.ValidacaoException;

public class Fornecedor extends Pessoa {

	private String razaoSocial;
	private String cnpj;
	
	/* Constructor */
	
	public Fornecedor() {
		super();
	}

	public Fornecedor(Integer codigo, String email, String nome, String razaoSocial, String cnpj) {
		super(codigo, email, nome);
		this.razaoSocial = razaoSocial;
		this.cnpj = cnpj;
	}

	/* Valida��o dos campos */
	
	public void valida() throws ValidacaoException{
		super.valida();
		if(razaoSocial == null || razaoSocial.equals("")) {
			throw new ValidacaoException("Preencha corretamente o campo de Raz�o Social");
		}
		if(cnpj == null || cnpj.equals("")) {
			throw new ValidacaoException("Preencha corretamente o campo de CNPJ");
		}
	}

	/* Getters and Setters */

	public String getRazaoSocial() {
		return razaoSocial;
	}

	public void setRazaoSocial(String razaoSocial) {
		this.razaoSocial = razaoSocial;
	}

	public String getCnpj() {
		return cnpj;
	}

	public void setCnpj(String cnpj) {
		this.cnpj = cnpj;
	}
	
	
}
