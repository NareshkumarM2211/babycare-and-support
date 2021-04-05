package bean;

public class Booking {
	private int id; //Booking id
	private String hname, hphone; // h = hospital
	private String pname, pcname, pphone, preason, pdate, pcage; //p = patient, c = child 
	//private int pcage; 
	
	public void setId(int id) {
		this.id = id;
	}
	
	public void setHname(String hname) {
		this.hname = hname;
	}
	
//	public void setHaddress(String haddress) {
//		this.haddress = haddress;
//	}
//	
//	public void setHcity(String hcity) {
//		this.hcity = hcity;
//	}
//	
//	public void setHstate(String hstate) {
//		this.hstate = hstate;
//	}
	
	public void setHphone(String hphone) {
		this.hphone = hphone;
	}
	
	public void setPname(String pname) {
		this.pname = pname;
	}
	
	public void setPcname(String pcname) {
		this.pcname = pcname;
	}
	
	public void setPphone(String pphone) {
		this.pphone = pphone;
	}
	
	public void setPreason(String preason) {
		this.preason = preason;
	}
	
	public void setPdate(String pdate) {
		this.pdate = pdate;
	}
	
	public void setPcage(String pcage) {
		this.pcage = pcage;
	}
	
	public int getId() {
		return id;
	}
	
	public String getHname() {
		return hname;
	}
	
//	public String getHaddress() {
//		return haddress;
//	}
//	
//	public String getHcity() {
//		return hcity;
//	}
//	
//	public String getHstate() {
//		return hstate;
//	}
	
	public String getHphone() {
		return hphone;
	}
	
	public String getPname() {
		return pname;
	}
	
	public String getPcname() {
		return pcname;
	}
	
	public String getPphone() {
		return pphone;
	}
	
	public String getPreason() {
		return preason;
	}
	
	public String getPdate() {
		return pdate;
	}
	
	public String getPcage() {
		return pcage;
	}
}
