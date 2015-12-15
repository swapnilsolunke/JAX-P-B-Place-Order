/**
 * 
 */
package com.rudrasoft.saxonlinepo.util;

/**
 * @author Rudra
 *
 */
public class Demo {

	/**
	 * @param args
	 */
	static{
		System.out.println("static block");
	}
	
	{
		System.out.println("non statc block");
	}
	
	public static void m1(){
		System.out.println("m1");
	}
	public static void m3(){
		System.out.println("m3");
	}
	public void m2(String arg){
		System.out.println(arg);
	}
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		String s = "";
		double d = 0;
		System.out.println("Result = "+s+d);
		m1();
		m3();
		new Demo().m2("first call");
		new Demo().m2("second call");
	}

}
