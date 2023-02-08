package Shopping.model;

public class Cart {
	private int cid;
	private int id;
	private int pid;
	private String itemname;
	private int price;
	private int quantity;
	private String size;
	private String colour;

	public Cart( int id, int pid,int cid, String itemname, int price, String size) {
		super();
		this.cid = cid;
		this.id = id;
		this.pid = pid;
		this.itemname = itemname;
		this.price = price;
		this.size = size;
	}

	public Cart( int pid, int cid,int id, String itemname, int price, int quantity, String size) {
		super();
		this.cid = cid;
		this.id = id;
		this.pid = pid;
		this.itemname = itemname;
		this.price = price;
		this.size = size;
		this.quantity = quantity;
	}

	public Cart(int id, int pid, String itemname, int price, String size) {
		super();
		this.id = id;
		this.pid = pid;
		this.itemname = itemname;
		this.price = price;
		this.size = size;
	}

	
	public Cart(int id, int pid, String itemname, int price, String size, String colour) {
		super();
		this.id = id;
		this.pid = pid;
		this.itemname = itemname;
		this.price = price;
		this.size = size;
		this.colour = colour;
	}
	

	public Cart( int id, int pid,int cid, String itemname, int price, int quantity, String size, String colour) {
		super();
		this.cid = cid;
		this.id = id;
		this.pid = pid;
		this.itemname = itemname;
		this.price = price;
		this.quantity = quantity;
		this.size = size;
		this.colour = colour;
	}

	public String getColour() {
		return colour;
	}

	public void setColour(String colour) {
		this.colour = colour;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public String getSize() {
		return size;
	}

	public void setSize(String size) {
		this.size = size;
	}

	public int getCid() {
		return cid;
	}

	public void setCid(int cid) {
		this.cid = cid;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getPid() {
		return pid;
	}

	public void setPid(int pid) {
		this.pid = pid;
	}

	public String getItemname() {
		return itemname;
	}

	public void setItemname(String itemname) {
		this.itemname = itemname;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

}
