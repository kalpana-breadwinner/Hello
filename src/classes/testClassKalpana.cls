@isTest
public class testClassKalpana {
    @isTest static void method1(){
        testForAPI.globalStaticVoidMethod();
        testForAPI fa = new testForAPI();
        fa.multiplicationFromPublicClass(2,1);
        testForAPI.userWrapper uw = new testForAPI.userWrapper();
        uw.name = 'PaymentID';
        uw.job = 'Reference';
        fa.getUserXml(uw);
    }
}