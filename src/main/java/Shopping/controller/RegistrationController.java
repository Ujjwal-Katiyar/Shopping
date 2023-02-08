package Shopping.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import Shopping.dao.UserDao;
import Shopping.helper.ConnectionProvider;
import Shopping.model.Message;
import Shopping.model.User;

@Controller
public class RegistrationController {

	
	@RequestMapping("/login")
	public String login() {
		return "login";
	}

	@RequestMapping(path = "/checklogin", method = RequestMethod.POST)
	public String checkLogin(@RequestParam("email") String email, @RequestParam("password") String password,
			HttpServletRequest request) {
		UserDao ud = new UserDao(ConnectionProvider.getConnection());
		User user = ud.getUserByEmailAndPassword(email, password);
		if (user == null) {

			Message m = new Message("Login again", "not_sucess", "alert-danger");
			request.getSession().setAttribute("message", m);
			return "redirect:/login";
		} else {
			request.getSession().setAttribute("user", user);
			return "redirect:/profile";
		}

		// return "redirect:/profile";

	}

	@RequestMapping("/signin")
	public String Signin() {
		return "sign_in";
	}

	@RequestMapping(path = "/register", method = RequestMethod.POST)
	public String register(@ModelAttribute User user, Model model, HttpServletRequest request) {
		UserDao ud = new UserDao(ConnectionProvider.getConnection());
		if (ud.saveUser(user)) {
			Message m = new Message("Registration Sucessful", "sucess", "alert-success");

			request.getSession().setAttribute("message", m);

			System.out.println("Registration sucessful");
			return "redirect:/signin";
		} else {
			Message m = new Message("Registration NotSucessful", "sucess", "alert-danger");

			request.getSession().setAttribute("message", m);

			System.out.println("Registration sucessful");
			return "redirect:/signin";
		}
	}

	@RequestMapping("/logout")
	public String logout(HttpServletRequest request) {
		request.getSession().removeAttribute("user");
		Message m = new Message("Logout", "logout", "alert-danger");
		request.getSession().setAttribute("message", m);

		return "redirect:/login";

	}
}
