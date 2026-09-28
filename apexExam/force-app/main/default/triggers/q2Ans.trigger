

//a ans:) Identify at least four technical problems or risks in the implementation above.

  // 1. SOQL queries are inside a for loop (SOQL-in-loop), which will hit governor limits on bulk operations.
// 2. DML   
// 3. The same Account could be updated multiple times within a single  trigger execution if multiple Opportunities for the same Account are processed in one batch.
// 4. The trigger does not handle cases where opp.AccountId is null, which  



// b) Explain how these problems can affect Salesforce governor limits, data processing, or transaction
//b Explaination: SOQL-in-loop and DML-in-loop can easily exceed Salesforce governor limits when processing large batches, causing runtime exceptions and failed transactions. Multiple updates to the same
// cause unnecessary locking and slower performance. Not checking for null AccountId can cause exceptions.
//cause NullPointerExceptions.




// c) Rewrite or redesign the implementation so that multiple Opportunities and Accounts can be processed
// safely in one transaction.

    
//C Ans: 

trigger q2Ans on Opportunity (after insert, after update) {
    
     Set<Id> accountIds = new Set<Id>();

 for(Opportunity opp : Trigger.new){
   
    if(opp.AccountId != null){
        accountIds.add(opp.AccountId);
    }
}   for(Opportunity opp : Trigger.new){
    if(opp.AccountId != null){
        accountIds.add(opp.AccountId);
    }
}  
Map<Id, Decimal> accountTotalMap = new Map<Id, Decimal>();
  for(Opportunity opp : [SELECT Id, Amount, AccountId FROM Opportunity WHERE AccountId IN :accountIds]){
    if(opp.AccountId != null && 
    opp.Amount != null){accountTotalMap.put(opp.AccountId, accountTotalMap.getOrDefault(opp.AccountId, 0) + opp.Amount);        
        }
}
}



//d) Explain how you would organize the trigger and supporting Apex classes so that business logic is not
//unnecessarily kept inside the trigger itself.

 //d Ans: Move business logic to a separate Apex handler class; the trigger should only collect relevant records and delegate processing to this class, ensuring separation of concerns
 

