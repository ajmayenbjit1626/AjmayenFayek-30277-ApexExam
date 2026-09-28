


//a) Identify the weaknesses in the current error-handling implementation.

//a ans: - The current implementation catches all exceptions but does not identify which specific Lead records failed.
//- Using a single DML statement with a try/catch causes the entire   operation to fail if any record causes an error.
// - It does not log or return detailed error information for failed records.
// - It does not use Database.insert with the allOrNone=false option, which would allow
// partial success and provide per-record error details.


   //b) Design or write Apex logic that allows valid Lead records to succeed while capturing detailed information
//about records that fail.

public with sharing class q5 {


  public static List<Database.SaveResult> insertLeads(List<Lead> leadsToInsert) {
        List<Database.SaveResult> results = Database.insert(leadsToInsert, false);
        return results;     
  }
   

}



// c) Explain how meaningful exception handling should be structured when an operation may encounter DML
//errors. Include the role of try, catch, and finally where each is appropriate.

//C Ans: Meaningful exception handling should use try-catch blocks to catch exceptions that may occur during DML operations. The try block should contain the DML statement. 
// The catch block should handle the exception by logging the error, identifying failed records, and taking appropriate action such as alerting admins or retrying if appropriate. The finallyblock is used for cleanup actions that must occur regardless of success or failure, such as releasing resources or sending notifications.

//  d) Describe what error information should be recorded or returned so that support teams can investigate
// individual failed records without relying only on debug logs




// d. Describe what error information should be recorded or returned so that support teams can investigate
// individual failed records without relying only on debug logs. 

//d.Ans: The error message will be included in the Database.SaveResult.getErrors() output for each failed record, including the specific error message, status code, and which Lead failed.
//  without needing It can be stored in a custom object, sent in an email, or returned from the method to allow support teams to review which records failed .