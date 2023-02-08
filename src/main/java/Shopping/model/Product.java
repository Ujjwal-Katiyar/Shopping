package Shopping.model;

public class Product {

	private int  pid;
	private String pname;
	private String pdescription;
	private String pimage;
	private int pprice;
	
	
	public int getPprice() {
		return pprice;
	}

	public void setPprice(int pprice) {
		this.pprice = pprice;
	}

	public Product(int pid, String pname, String pdescription, String pimage, int pprice) {
		super();
		this.pid = pid;
		this.pname = pname;
		this.pdescription = pdescription;
		this.pimage = pimage;
		this.pprice=pprice;
	}
	
	public Product(String pname, String pdescription, String pimage,int pprice) {
		super();
		this.pname = pname;
		this.pdescription = pdescription;
		this.pimage = pimage;
		this.pprice=pprice;
	}

	public int getPid() {
		return pid;
	}
	public void setPid(int pid) {
		this.pid = pid;
	}
	public String getPname() {
		return pname;
	}
	public void setPname(String pname) {
		this.pname = pname;
	}
	public String getPdescription() {
		return pdescription;
	}
	public void setPdescription(String pdescription) {
		this.pdescription = pdescription;
	}
	public String getPimage() {
		return pimage;
	}
	public void setPimage(String pimage) {
		this.pimage = pimage;
	}
	
	
}
