public with sharing  class testTab {
	public String publicVar;
	private string privateVar;
    
	public testTab(){
		publicVar = 'public var';
		privateVar = 'private var';
		system.debug(publicVar);
		system.debug(privateVar);
		privateMethod();
        rtnPrivateMethod();
        //HTTPResponse res = sendGETRequest();
        //System.debug(res.getBody());
	}	

	public String rtnPublicVar(){
		String t = publicVar;
		return t;
	}

	public String rtnPrivateVar(){
		String t = privateVar;
		return t;
	}

	private String rtnPublicVarFromPrivateMethod(){
		String t = publicVar;
		return t;
	}

	private String rtnPrivateVarFromPrivateMethod(){
		String t = privateVar;
		return t;
	}

	public String publicMethod(){
		String methodName = 'testTab method1';
		return methodName;
	}

	private String privateMethod(){
		String methodName = 'testTab privateMethod';
		system.debug(methodName);
		return methodName;
	}

	public String rtnPrivateMethod(){
		String t = privateMethod();
		return t;
	}

	public String rtnAllVars(){
		String t = publicVar + ' 1s ' + privateVar + ' 2s ' + rtnPublicVar() + ' 3s ' + rtnPrivateVar() + ' 4s ';
		t += publicMethod() + ' 5s ' + privateMethod() + ' 6s ' + rtnPrivateVarFromPrivateMethod() + ' 7s ' + rtnPublicVarFromPrivateMethod();
		system.debug(t);
		return t;
	}

	public static Integer multiply(Integer a, Integer b){
        return a*b;
    }

    private HttpResponse sendGETRequest(){
    	HttpRequest req = new HttpRequest();
		req.setEndpoint('https://reqres.in/api/users?page=4');
		req.setMethod('GET');

		Http http = new Http();
		HTTPResponse res = http.send(req);
    	return res;
    }

    public String getUsers(){
    	HTTPResponse res = sendGETRequest();
    	return res.getBody();
    }

    private HttpResponse sendPOSTRequest(string requestBody){
    	HttpRequest req = new HttpRequest();
    	req.setBody(requestBody);
    	req.setEndpoint('https://reqres.in/api/users');
    	req.setHeader('Content-type','text/xml');
        req.setHeader('Accept', 'application/json');
    	req.setMethod('POST');
    	req.setTimeout(120000);

    	Http http = new Http();
		HTTPResponse res = http.send(req);
    	return res;
    }

    public String createUser(String requestBody){
        HTTPResponse res = sendPOSTRequest(requestBody);
        System.debug(res.getBody());
        String returnResponse = '';
        if(res.getStatusCode() == 201){
        	returnResponse = res.getBody();
        }
        else{
        	returnResponse = 'Error';
        }
    	return returnResponse;
    }
}