package classes;

public class Trip {
	private int id;
	private String name;
	private String destination;
	private float price;
	private String photo;

	public Trip(int id, String name, String destination, float price, String photo) {
		this.id = id;
		this.name = name;
		this.destination = destination;
		this.price = price;
		this.photo = photo;
	}

	public int getID() {
		return id;
	}

	public String getName() {
		return name;
	}

	public String getDestination() {
		return destination;
	}

	public float getPrice() {
		return price;
	}
	
	public String getPhoto() {
		return photo;
	}
}
