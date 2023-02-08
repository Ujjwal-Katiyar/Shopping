package Shopping.interceptor;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import Shopping.dao.CartDao;
import Shopping.helper.ConnectionProvider;
import Shopping.model.Message;
//import Shopping.model.Product;
//import Shopping.dao.ProductDao;
public class CartInterceptor extends HandlerInterceptorAdapter {
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {



		// Access the send data from the form
		System.out.println("this is the interceptor");
		int id = Integer.parseInt(request.getParameter("userid"));
		int pid = Integer.parseInt(request.getParameter("productid"));
		String size = request.getParameter("size");
		String colour = request.getParameter("colour");
		System.out.println(id + "" + pid + size);
		//care the product whic we want to validate 
		//ProductDao pd = new ProductDao(ConnectionProvider.getConnection());
		//Product p = pd.getProductById(pid);
		CartDao cd = new CartDao(ConnectionProvider.getConnection());
		boolean b = cd.getCartItemByidAndSizeAndColour(id, pid, size,colour);
		System.out.println("This isCert intecprtor" + b);
		if (b == false) {
			return true;
		} else {
			System.out.println("Product cannot added into catt");
			Message m = new Message("Duplicate product cannot be added", "not_sucess", "alert-danger");
			request.getSession().setAttribute("message", m);
			response.sendRedirect("/Shopping/profile");
			return false;
		}

	}
}
