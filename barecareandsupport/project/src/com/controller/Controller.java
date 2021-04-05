package com.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.JOptionPane;

import com.beans.Product;
import com.beans.User;
import com.model.DB;

import bean.Hospital;
import dao.HospitalDao;

public class Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
	ArrayList<Product> list = new ArrayList<>();
	static ArrayList<String> cartlist = new ArrayList<>();
	ArrayList<User> userList = new ArrayList<>();
	HttpSession session;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String page = request.getParameter("page");
		if(page.equals("bookhospital")) 
		{	
			String hospitalid = request.getParameter("id");
			Hospital hosp = HospitalDao.getHospital(hospitalid);
			request.setAttribute("hname", hosp.getName());
			request.setAttribute("haddress", hosp.getAddress());
			request.setAttribute("hcity", hosp.getCity());
			request.setAttribute("hstate", hosp.getState());
			request.setAttribute("hphone", hosp.getPhone());
			RequestDispatcher rd = request.getRequestDispatcher("/bookappointment.jsp");
			rd.forward(request, response);
		}		
		if(page == null || page.equals("product")) 
		{
			
			DB db = new DB();
			 try {
				list = db.fetch();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			 session = request.getSession();
			 session.setAttribute("cartlist", cartlist);
			 session.setAttribute("list", list);
			
			request.getRequestDispatcher("product.jsp").forward(request, response);
		}
		else {
			doPost(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String page = request.getParameter("page");	
		if(page.equals("bookhospital")){
			String hospitalid = request.getParameter("id");
			Hospital hosp = HospitalDao.getHospital(hospitalid);
			request.setAttribute("hname", hosp.getName());
			request.setAttribute("haddress", hosp.getAddress());
			request.setAttribute("hcity", hosp.getCity());
			request.setAttribute("hstate", hosp.getState());
			request.setAttribute("hphone", hosp.getPhone());
			request.getRequestDispatcher("/bookappointment.jsp").forward(request, response);
		}
		if(page.equals("login")) {
			request.getRequestDispatcher("login.jsp").forward(request, response);
		}
		
		if(page.equals("sign-up")) {
			request.getRequestDispatcher("signup.jsp").forward(request, response);
		}
		if(page.equals("home")) {
			request.getRequestDispatcher("home.jsp").forward(request, response);
		}
		if(page.equals("food")) {
			request.getRequestDispatcher("food.jsp").forward(request, response);
		}
		if(page.equals("dress")) {
			request.getRequestDispatcher("dress.jsp").forward(request, response);
		}
		if(page.equals("wetwipes")) {
			request.getRequestDispatcher("wetwipes.jsp").forward(request, response);
		}
		if(page.equals("sign-up-form")) {
			String name = request.getParameter("name");
			String email = request.getParameter("email");
			String username = request.getParameter("username");
			String address = request.getParameter("address");
			String password_1 = request.getParameter("password_1");
			String password_2 = request.getParameter("password_2");
			
			if(password_1.equals(password_2)) {
				
				User user = new User();
				user.setAddress(address);
				user.setEmail(email);
				user.setName(name);
				user.setUsername(username);
				user.setPassword(password_1);
				
				DB db = new DB();
				try {
					db.addUser(user);
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
				
				request.setAttribute("username", username);
				request.setAttribute("msg", "Account created successfully, Please Login!");
				request.getRequestDispatcher("login.jsp").forward(request, response);
				
			}else {
				request.setAttribute("msg", "The two passwords do not match");
				request.setAttribute("name", name);
				request.setAttribute("address", address);
				request.setAttribute("email", email);
				request.setAttribute("username", username);
				request.getRequestDispatcher("signup.jsp").forward(request, response);
			}
			
		}
		
		if(page.equals("login-form")) {
			
			String username = request.getParameter("username");
			String password = request.getParameter("password");
			
			DB db = new DB();
			User user = new User();
			boolean status = false;
			try {
				status = db.checkUser(username,password);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			if(status) {
				session = request.getSession();
				session.setAttribute("session", session);
				
				try {
					userList = db.fetchUser();
				} catch (SQLException e) {
					e.printStackTrace();
				}
				session.setAttribute("address", user.fetchadd(userList,username));
				session.setAttribute("email", user.fetchemail(userList,username));
				session.setAttribute("name", user.fetchname(userList,username));
				session.setAttribute("username", username);
				request.getRequestDispatcher("product.jsp").forward(request, response);
			}else {
				request.setAttribute("msg", "Invalid Crediantials");
				request.setAttribute("username", username);
				request.getRequestDispatcher("login.jsp").forward(request, response);
			}
			
		}
		
		if(page.equals("logout")) {
			session = request.getSession();
			session.invalidate();
			
			 session = request.getSession();
			 cartlist.clear();
			 session.setAttribute("cartlist", cartlist);
			 session.setAttribute("list", list);
			
			request.getRequestDispatcher("product.jsp").forward(request, response);
		}
		
		if(page.equals("food") || page.equals("dress") || page.equals("wetwipes") || page.equals("soap") || page.equals("all-products")) 
		{ DB db = new DB();
			 try {
				list = db.fetch();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			request.setAttribute("list", list);			
			
			if(page.equals("food"))
				request.getRequestDispatcher("food.jsp").forward(request, response);
			
			if(page.equals("dress"))
				request.getRequestDispatcher("dress.jsp").forward(request, response);
			
			if(page.equals("wetwipes"))
				request.getRequestDispatcher("wetwipes.jsp").forward(request, response);
			
			if(page.equals("soap"))
				request.getRequestDispatcher("soap.jsp").forward(request, response);
			
			if(page.equals("all-products"))
				request.getRequestDispatcher("all-products.jsp").forward(request, response);
		}
		
		
		
		if(page.equals("showcart")) {
			request.getRequestDispatcher("cart.jsp").forward(request, response);
		}
		
		if(page.equals("addtocart")) 
		{
			String id = request.getParameter("id");
			String action = request.getParameter("action");
			Product p = new Product();
			boolean check = p.check(cartlist,id);
			
			if(check)
			{
			JOptionPane.showMessageDialog(null, "Product is already added to Cart", "Info", JOptionPane.INFORMATION_MESSAGE); 			
			    request.getRequestDispatcher("product.jsp").forward(request, response);
			}
			else 
			{
			cartlist.add(id);
			JOptionPane.showMessageDialog(null, "Product successfully added to Cart", "Info", JOptionPane.INFORMATION_MESSAGE); 
			request.getRequestDispatcher("product.jsp").forward(request, response);
			}
			
			if(action.equals("allproducts"))
				request.getRequestDispatcher("all-products.jsp").forward(request, response);
			
			if(action.equals("wetwipes"))
				request.getRequestDispatcher("wetwipes.jsp").forward(request, response);
			if(action.equals("soap"))
				request.getRequestDispatcher("soap.jsp").forward(request, response);
			if(action.equals("dress"))
				request.getRequestDispatcher("dress.jsp").forward(request, response);
			if(action.equals("food"))
				request.getRequestDispatcher("food.jsp").forward(request, response);
		}
		
		if(page.equals("success")) {
			
			request.getRequestDispatcher("success.jsp").forward(request, response);
			
			/*session = request.getSession();
			 cartlist.clear();
			 session.setAttribute("cartlist", cartlist);*/
		}

		
		if(page.equals("remove")) {
			String id = request.getParameter("id");
			Product p = new Product();
			cartlist = p.remove(cartlist,id);
			
			session = request.getSession();
			session.setAttribute("cartlist", cartlist);
			request.getRequestDispatcher("cart.jsp").forward(request, response);
		}
		
		
		if(page.equals("price-sort")) {
			String price = request.getParameter("sort");
			String action = request.getParameter("action");
			Product p = new Product();
			if(price.equals("low-to-high"))
				list = p.lowtohigh(list);
			else
				list = p.hightolow(list);
			
			session.setAttribute("list", list);
			
		
			if(action.equals("all-products"))
				request.getRequestDispatcher("all-products.jsp").forward(request, response);
			if(action.equals("food"))
				request.getRequestDispatcher("food.jsp").forward(request, response);
			if(action.equals("dress"))
				request.getRequestDispatcher("dress.jsp").forward(request, response);
			
			if(action.equals("wetwipes"))
				request.getRequestDispatcher("wetwipes.jsp").forward(request, response);
			if(action.equals("soap"))
				request.getRequestDispatcher("soap.jsp").forward(request, response);
		}
	}

}
