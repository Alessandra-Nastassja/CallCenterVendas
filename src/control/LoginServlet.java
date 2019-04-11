package control;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class loginServlet
 */
@WebServlet("/loginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public LoginServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/paginas/login.jsp");
		dispatcher.forward(request, response);
		
		PrintWriter out = response.getWriter();
		String usuario = request.getParameter("usuario");
		String senha = request.getParameter("senha");

		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection(
					"jdbc:mysql://localhost:3306/db_call_center?useTimezone=true&serverTimezone=America/Sao_Paulo",
					"root", "");
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery("select usuario,senha from TB_USUARIO where usuario='"+usuario+"' and senha='"+senha+"'");
			
			if(rs.next()) {
				RequestDispatcher dispatcher1 = request.getRequestDispatcher("/WEB-INF/paginas/fornecedores.jsp");
				dispatcher1.forward(request, response);
		        HttpSession session = request.getSession();
		        session.setAttribute("usuario", usuario);
		        
		        
		      }else {
		        out.println("Wrong id and password");
		      }
			
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
		      // TODO Auto-generated catch block
		      e.printStackTrace();
		    }
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
