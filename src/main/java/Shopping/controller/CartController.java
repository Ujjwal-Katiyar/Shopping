package Shopping.controller;

import javax.servlet.http.HttpServletRequest;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import Shopping.dao.CartDao;
import Shopping.dao.ProductDao;
import Shopping.helper.ConnectionProvider;
import Shopping.model.Cart;
import Shopping.model.Message;
import Shopping.model.Product;

@Controller
public class CartController {

	@RequestMapping("/addtocart")
	public String submit(@RequestParam("userid") int id, @RequestParam("productid") int pid,
			@RequestParam(value = "size", required = false) String size,
			@RequestParam(value = "colour", required = false) String colour, HttpServletRequest request) {
		// create product dao for access the product by product id
		ProductDao pd = new ProductDao(ConnectionProvider.getConnection());
		Product p = pd.getProductById(pid);

		// create the cartobjet for putting product into cart
		Cart c = new Cart(id, pid, p.getPname(), p.getPprice(), size, colour);

		// cart dao for saving product into the user cart
		CartDao cd = new CartDao(ConnectionProvider.getConnection());
		if (cd.saveCart(c)) {
			// if added sucess in database
			Message m = new Message("Product Add Sucessfully", "not_sucess", "alert-success");
			request.getSession().setAttribute("message", m);
			System.out.println("SUCESS");
			return "redirect:/profile";
		} else {
			// if not added sucess in database
			System.out.println("ERROEIN CAT DAO");
			return "redirect:/profile";
		}

	}

	@RequestMapping("/checkout")
	public String checkout() {
		return "checkout";
	}

	@RequestMapping("/payment")
	public String payment() {
		return "payment";
	}

	@RequestMapping("/deletecartproduct/{cid}")
	public String deletecartproduct(@PathVariable("cid") int cid) {
		CartDao cd = new CartDao(ConnectionProvider.getConnection());
		System.out.println("deleter item checker" + cd.deleteCartProductById(cid));
		return "redirect:/checkout";
	}

}
