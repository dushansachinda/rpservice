package com.test.interceptor;

import io.ballerina.runtime.internal.values.ObjectValue;

public class InterceptorManager {

	public static String interceptRequest(ObjectValue caller, ObjectValue request) {
		
		//Caller newcaller = new Caller(caller);
		//Request newReq = new Request(request);
		//TODO plugin chain and othe logic should be go here
		
		System.out.println("caller " + caller);
		System.out.println("caller " + request);
		return "Hello . NPX. .";
	}

}
