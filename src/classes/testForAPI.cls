global class testForAPI {
	global string aForAPI;
    public string bForAPI;
    private string cForAPI;
    String voidMethodVar;
    
    global testForAPI(){
        aForAPI = 'its global var';
        bForAPI = 'its public var';
        cForAPI = 'its private var';
        voidMethodVar = 'No Value';
        system.debug(aForAPI);
        system.debug(bForAPI);
        system.debug(cForAPI);
        multiplication(3,2);
        returnAllVars();
        rtnPublicClassMethods();
        returnStaticMethods();
    }

    global String returnGlobalVariable(){
    	return aForAPI;
    }

    global String returnPublicVariable(){
        return bForAPI;
    }

    global String returnPrivateVariable(){
        return cForAPI;
    }

    public String rtnPrivateVariableFromPublicMethod(){
        return cForAPI;
    }

    private String rtnPrivateVariableFromPrivateMethod(){
        return cForAPI;
    }
    
    public String rtnPublicVariableFromPublicMethod(){
    	return bForAPI;
    }

    private String rtnPublicVariableFromPrivateMethod(){
        return bForAPI;
    }

    public String rtnGlobalVariableFromPublicMethod(){
        return aForAPI;
    }

    private String rtnGlobalVariableFromPrivateMethod(){
        return aForAPI;
    }

    global Integer multiplication(Integer a, Integer b){
        return a*b;
    }

    global Integer multiplicationFromPublicClass(Integer a, Integer b){
        Integer m = testTab.multiply(a,b);
        return m;
    }

    global String returnAllVars(){
        String textVar = aForAPI + ' 1s ' + bForAPI + ' 2s ' + cForAPI + ' end ' + voidMethodVar +' END ';
        textVar += rtnPrivateVariableFromPublicMethod();
        textVar += ' 3s ';
        textVar += rtnPrivateVariableFromPrivateMethod();
        textVar += ' 4s ';
        textVar += returnGlobalVariable();
        textVar += ' 5s ';
        textVar += returnPublicVariable();
        textVar += ' 6s ';
        textVar += returnPrivateVariable();
        textVar += ' 7s ';
        textVar += rtnPublicVariableFromPublicMethod();
        textVar += ' 8s ';
        textVar += rtnPublicVariableFromPrivateMethod();
        textVar += ' 8s ';
        textVar += rtnGlobalVariableFromPublicMethod();
        textVar += ' 9s ';
        textVar += rtnGlobalVariableFromPrivateMethod();
        globalVoidMethod();
        textVar += ' 10s '+voidMethodVar;
        publicVoidMethod();
        textVar += ' 11s '+voidMethodVar;
        privateVoidMethod();
        textVar += ' 12s '+voidMethodVar;
        system.debug(textVar);
        return textVar;
    }

    global string nothing;

    global String rtnPublicClassMethods(){
        testTab bw = new testTab();
        String t = bw.rtnAllVars();
        system.debug(t);
        return t;
    }

    global static void globalStaticVoidMethod(){
        String useInStatic  = 'static Void Method';
    }

    global static String globalStaticMethod(){
        return 'static Method';
    }

    global static Integer globalStaticMultiplyMethod(Integer a, Integer b){
        return a*b;
    }

    global String returnStaticMethods(){
        Integer m = globalStaticMultiplyMethod(2,5);
        String t = globalStaticMethod() + ' 1s ' + m;
        return t;
    }

    global void globalVoidMethod(){
        voidMethodVar  = 'Value assigned in Void Method';
    }

    public void publicVoidMethod(){
        voidMethodVar  = 'public Void Method';
    }

    private void privateVoidMethod(){
        voidMethodVar  = 'private Void Method';
    }

    global String getUsers(){
        testTab tt = new testTab();
        String res = tt.getUsers();
        return res;
    }

    global String createUser(userWrapper uW){
        String requestBody = getUserXml(uW);
        testTab tt = new testTab();
        String res = tt.createUser(requestBody);
        return res;
    }

    global class userWrapper{
        public Id userId;
        global String name;
        global String job;
        public String response;
    }

    public String getUserXml(userWrapper uW){
        XmlStreamWriter w = new XmlStreamWriter();
        w.writeStartElement('', 'name', '');
        w.writeCharacters(String.valueOf(uW.name));
        w.writeEndElement();
        w.writeStartElement('', 'job', '');
        w.writeCharacters(String.valueOf(uW.job));
        w.writeEndElement();
        String xmlOutput = w.getXmlString();
        w.close();
        return xmlOutput;
    }
}