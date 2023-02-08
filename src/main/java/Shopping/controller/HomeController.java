package Shopping.controller;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class HomeController {

	@RequestMapping("/")
	public String Home() {
		return "navbar";
		
	}

	

	@RequestMapping("/profile")
	public String profile(Model m) {

		return "profile";
	}



}