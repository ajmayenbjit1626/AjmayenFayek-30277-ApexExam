
// A company needs to integrate Salesforce with an external currency service.
// Each Opportunity contains:
// ● Amount — stored in BDT
// ● Expected_Currency_Type__c — for example USD, EUR, or JPY
// ● Expected_Currency_Amount__c — value to be calculated from the external exchange rate
// The external service requires authentication. It returns JSON containing the exchange rate. API endpoint
// information and credentials must not be hardcoded in Apex.
// The service may return:
// ● HTTP 200 with valid JSON
// ● HTTP 400 for an invalid currency
// ● HTTP 401 for authentication failure
// ● HTTP 500 for a service-side problem
// ● A timeout or callout exce

// a) Describe how you would configure and use a Named Credential for this integration and show how Apex
// would reference the configured endpoint when performing the callout.

//a.Ans : From My Apex org Setup Menu I will nevigate the Name Credential function then I will Create the external credential and principle credential and then integrate with the api url and the key 



//b) Write the main Apex logic required to build the HTTP request, perform the callout, process a successful
//response, deserialize the relevant JSON data, and obtain the exchange rate.

//b.Ans:
// Http http = new Http();
// HttpRequest request = new HttpRequest();
// request.setEndpoint('https://ExchangeRate__Api');
// request.setMethod('GET'); HttpResponse response = http.send(request);
// // If the request is successful, parse the JSON response. if(response.getStatusCode() == 200) {
// // Deserialize the JSON string into collections of primitive data types.
// Map<String, Object> results = (Map<String, Object>) JSON.deserializeUntyped(response.getBody()); 
// System.debug('Received the following excApi:');
// for(Object excAPi: newExcApi) {
// System.debug(excApi);
// }



//c) Design the error-handling logic for unsuccessful HTTP responses, invalid response content, and callout
//exceptions

//C.Ans: 

try {
    if(request.getResponse > 400 ){
        throw new  customException()
        
    }
} catch (Exception e) {
    System.Debug( e.getMessage)
}


public with sharing class q8 {
    public q8() {

    }
}