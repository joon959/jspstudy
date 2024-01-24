package com.yong.scope;

public class ScopeTest {
	private int count;
	
	
	public ScopeTest() {
		System.out.println("scopeTest객체 생성");
		count=0;
	}


	public int getCount() {
		System.out.println("현재 count 값: "+count);
		return count;
	}


	public void setCount(int count) {
		this.count += count;
		System.out.println(count+"값이 누적되어 현재 count 값: "+this.count);
	}
}
