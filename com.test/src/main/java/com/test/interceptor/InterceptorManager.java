package com.test.interceptor;

import io.ballerina.runtime.internal.values.ObjectValue;

public class InterceptorManager {

	public static boolean interceptRequest(ObjectValue caller, ObjectValue request) {
	
		Request reqWrapper = new  Request(request);
		
		System.out.println("caller " + caller);
		System.out.println("request " + request);
		
		System.out.println("Request wrapper path info"+reqWrapper.getPathInfo());
		return true;
	}

}
