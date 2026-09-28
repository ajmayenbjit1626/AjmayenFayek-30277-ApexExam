

// A sales organization stores customer information in Account, Contact, and Opportunity records.
// The business wants a reusable Apex service that receives an Account Id and returns:
// ● Account Id and Name
// ● Related Contacts with Id, Name, Email, and Phone
// ● Related Opportunities with Id, Name, StageName, Amount, and CloseDate
// The method will be called from multiple parts of the application. Users must only receive records they are
// permitted to access.
// The organization also wants a separate search feature where a user enters text such as "ABC" and searches
// across both Account Name and Contact Name


// 1.a) Write the Apex class/method structure and the query required to retrieve the Account together with the
// required related Contact and Opportunity records. 





public with sharing class q1A {
    
    public static  void getAccountDetails(Id accountId) {
        Account acc = [SELECT Id, Name, (SELECT Id, FirstName, LastName FROM Contacts), (SELECT
        Id, Name FROM Opportunities) FROM Account WHERE Id = :accountId];
        System.debug(acc);
        System.debug(acc.Contacts);
        System.debug(acc.Opportunities);

}

//1.b Design the text-search operation across Account and Contact. Write the appropriate Apex query and
// explain why the selected query mechanism is suitable for this requirement.
   
   public static List<List<SObject>> searchAccountsAndContacts(String searchText) {
    return [FIND :searchText IN NAME FIELDS RETURNING Account(Id, Name), Contact(Id, FirstName, LastName, Email, Phone)];
     }
     
  //b Explanation: SOSL is suitable here because it allows searching across multiple objects and fields  

//   c) Explain how the service should be designed so that record-level access and appropriate object/field
// access are respected when the method executes.   

 //C Ans: To ensure record-level and object/field-level access, the service should use "with sharing" to enforce sharing rules, and queries should not use "without
// sharing" or "with" keywords in SOQL queries, so that the platform's security and sharing rules are enforced automatically. This ensures users can only access records

// d. Assume the service may receive a list of multiple Account Ids instead of a single Account Id in the future.
// Explain how you would redesign the method to process the Accounts and their related records efficiently
// without placing SOQL queries inside loops.

  
//d Expanation : This method takes a Set of Account Ids, queries all Accounts and their related Contacts and Opportunities in a single SOQL query (outside any loop), and
// returns the results as a Map for efficient access; this approach avoids SOQL-in-loop and is bulk-safe.

}
