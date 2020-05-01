/***************************************************
* @author    	Neetesh Jain
* @date      	01 May 2020
* @description  Basic Http Callout Class.
***************************************************/
public without sharing class BasicHttpCalloutHandler {
    
    /**
    * Method name   : makeBasicCallout
    * @description  : Method used to make http callout.
    * @return       : void
    **/
    public static void makeBasicCallout() {
        try {
            Http http = new Http();
            HttpRequest request = new HttpRequest();
            request.setEndpoint('https://postman-echo.com/get?foo1=bar1&foo2=bar2');
            request.setMethod('GET');
            HttpResponse response = http.send(request);
            
            if (response.getStatusCode() == 200) {
                System.debug('Response:'+response.getBody());    
            }   
        } catch(System.Exception exp) {
            System.debug('System Exception --'+exp);
        }
    }
    
}