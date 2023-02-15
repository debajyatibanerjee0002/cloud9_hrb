package user.search.searchClass;

public class HotelSearchResult {
	String hotel_id;
	String hotel_name;
	String hotel_room_type;
	String addr;
	String from_date;
	String to_date;
	double single_room_price;
	double double_room_price;
	double deluxe_room_price;
	int hotel_type;
	public String getFrom_date() {
		return from_date;
	}
	public void setFrom_date(String from_date) {
		this.from_date = from_date;
	}
	public String getTo_date() {
		return to_date;
	}
	public void setTo_date(String to_date) {
		this.to_date = to_date;
	}
	public String getHotel_id() {
		return hotel_id;
	}
	public void setHotel_id(String hotel_id) {
		this.hotel_id = hotel_id;
	}
	public String getHotel_name() {
		return hotel_name;
	}
	public void setHotel_name(String hotel_name) {
		this.hotel_name = hotel_name;
	}
	public String getHotel_room_type() {
		return hotel_room_type;
	}
	public void setHotel_room_type(String hotel_room_type) {
		this.hotel_room_type = hotel_room_type;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public double getSingle_room_price() {
		return single_room_price;
	}
	public void setSingle_room_price(double single_room_price) {
		this.single_room_price = single_room_price;
	}
	public double getDouble_room_price() {
		return double_room_price;
	}
	public void setDouble_room_price(double double_room_price) {
		this.double_room_price = double_room_price;
	}
	public double getDeluxe_room_price() {
		return deluxe_room_price;
	}
	public void setDeluxe_room_price(double deluxe_room_price) {
		this.deluxe_room_price = deluxe_room_price;
	}
	public int getHotel_type() {
		return hotel_type;
	}
	public void setHotel_type(int hotel_type) {
		this.hotel_type = hotel_type;
	}	
}
