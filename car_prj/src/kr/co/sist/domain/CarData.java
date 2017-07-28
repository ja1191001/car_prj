package kr.co.sist.domain;

public class CarData {

	private String model, car_year, car_img;

	//생성자는 만들지 않는다. getter, setter만 만든다
	public String getModel() {
		return model;
	}

	public void setModel(String model) {
		this.model = model;
	}

	public String getCar_year() {
		return car_year;
	}

	public void setCar_year(String car_year) {
		this.car_year = car_year;
	}

	public String getCar_img() {
		return car_img;
	}

	public void setCar_img(String car_img) {
		this.car_img = car_img;
	}
	
	
	
}
