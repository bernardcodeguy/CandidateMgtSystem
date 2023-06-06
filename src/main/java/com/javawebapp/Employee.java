package com.javawebapp;

public class Employee {
	private int id;
	private String fname;
	private String lname;
	private String email;
	private String pass1;
	private String pass2;
	private String department;
	private String job;
	private String country;
	private String gender;
	private String question;
	private String answer;
	private String salary;
	private int is_approved;
	
	
	
	public Employee() {
		super();
		
	}
	
	

	public Employee(String fname, String lname, String email, String pass1, String pass2, String department,String job,String country,String gender,String question,String answer) {
		
		this.fname = fname;
		this.lname = lname;
		this.email = email;
		this.pass1 = pass1;
		this.pass2 = pass2;
		this.department = department;
		this.job = job;
		this.country = country;
		this.gender = gender;
		this.question = question;
		this.answer = answer;
	}
	
	
	
	

	public String getQuestion() {
		return question;
	}



	public void setQuestion(String question) {
		this.question = question;
	}



	public String getAnswer() {
		return answer;
	}



	public void setAnswer(String answer) {
		this.answer = answer;
	}



	public String getCountry() {
		return country;
	}



	public void setCountry(String country) {
		this.country = country;
	}



	public String getGender() {
		return gender;
	}



	public void setGender(String gender) {
		this.gender = gender;
	}


	public int getId() {
		return id;
	}



	public void setId(int id) {
		this.id = id;
	}



	public String getSalary() {
		return salary;
	}



	public void setSalary(String salary) {
		this.salary = salary;
	}



	public int getIs_approved() {
		return is_approved;
	}



	public void setIs_approved(int is_approved) {
		this.is_approved = is_approved;
	}



	public String getFname() {
		return fname;
	}


	public void setFname(String fname) {
		this.fname = fname;
	}


	public String getLname() {
		return lname;
	}


	public void setLname(String lname) {
		this.lname = lname;
	}


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}


	public String getPass1() {
		return pass1;
	}


	public void setPass1(String pass1) {
		this.pass1 = pass1;
	}


	public String getPass2() {
		return pass2;
	}


	public void setPass2(String pass2) {
		this.pass2 = pass2;
	}


	public String getDepartment() {
		return department;
	}


	public void setDepartment(String department) {
		this.department = department;
	}


	public String getJob() {
		return job;
	}


	public void setJob(String job) {
		this.job = job;
	}


	@Override
	public String toString() {
		return "Employee [id=" + id + ", fname=" + fname + ", lname=" + lname + ", email=" + email + ", pass1=" + pass1
				+ ", pass2=" + pass2 + ", department=" + department + ", job=" + job + ", salary=" + salary
				+ ", is_approved=" + is_approved + "]";
	}
	
		
	
}
