package control;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.dao.FornecedorDao;
import model.domain.Fornecedor;
import util.ValidacaoException;

@WebServlet("/fornecedorServlet")
public class FornecedorServlet extends HttpServlet {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private FornecedorDao fornecedorDao = new FornecedorDao();
	
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			String acao = request.getParameter("acao");
			if(acao != null) {
				
				if(acao.equals("create")) {
					Fornecedor fornecedor = criaFornecedor(request);
					try {
						fornecedor.valida();
					}catch(ValidacaoException e) {
						request.setAttribute("mensagem", "Mensagem: " + e.getMessage());
						request.setAttribute("fornecedor", fornecedor);
					}
					if(fornecedor.getCodigo() == null) {
						fornecedorDao.salvar(fornecedor); 
						request.setAttribute("mensagem", "Fornecedor salvo com sucesso!");
					}else {
						fornecedorDao.atualizar(fornecedor); 
						request.setAttribute("mensagem", "Fornecedor atualizada com sucesso!");
					}
				}else if(acao.equals("retrieve")) {
					String codigo = request.getParameter("codigo");
					Integer codFornecedor = Integer.parseInt(codigo);
					Fornecedor fornecedor = fornecedorDao.getFornecedorId(codFornecedor);
					
					request.setAttribute("fornecedor", fornecedor);
				}else if(acao.equals("delete")) {
					String codigo = request.getParameter("codigo");
					
					Integer codFornecedor = Integer.parseInt(codigo);
					fornecedorDao.excluir(codFornecedor);
					
					request.setAttribute("mensagem", "Fornecedor excluído com sucesso!");
				}
			}
			request.setAttribute("fornecedores",fornecedorDao.getFornecedores());
			RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/paginas/fornecedores.jsp");
			dispatcher.forward(request, response);
			
		}catch(SQLException | ClassNotFoundException | IllegalArgumentException e) {
			request.setAttribute("mensagem","Error: " + e.getMessage());
			RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/paginas/erro.jsp");
			dispatcher.forward(request, response);
		}
	}
	
	private Fornecedor criaFornecedor(HttpServletRequest request) {
		String nome = request.getParameter("nome");
		String razaoSocial = request.getParameter("razaoSocial");
		String email = request.getParameter("email");
		String cnpj = request.getParameter("cnpj");
		String codigo = request.getParameter("codigo"); 
		
		Fornecedor  fornecedor = new Fornecedor(null, email, nome, razaoSocial, cnpj);
		
		if(codigo != null && !codigo.equals("")) {
			fornecedor.setCodigo(Integer.parseInt(codigo));
		}
		return fornecedor;
	}
}

/* Ctrl + shift + o =  importar pacotes */