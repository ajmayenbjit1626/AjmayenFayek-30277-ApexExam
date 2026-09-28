

// An organization has approximately 2 million Account records. Every night, the system must evaluate eligible
// Accounts and update Customer_Tier__c according to the following rule:
// ● Annual Revenue ≥ 10,000,000 → Enterprise
// ● Annual Revenue ≥ 1,000,000 and < 10,000,000 → Medium
// ● Annual Revenue < 1,000,000 → Small
// Only active customer Accounts should be processed. The solution must work reliably with large data volumes
// and must provide a summary after processing is completed





// a) Design a Batch Apex class for this requirement and explain the responsibility of its start, execute, and
//finish methods.
// 




//a. Ans: 
  //  B

public with sharing class q6 implements Database.Batchable<SObject>, Database.RaisesPlatformEvents {

    public Database.QueryLocator start(Database.BatchableContext context) {
        // TODO: add a WHERE clause to filter records
         
         List<Account> filterAccount = [SELECT ]
         
        return Database.getQueryLocator([SELECT Id FROM SObject]);
    }

    public void execute(Database.BatchableContext context, List<SObject> scope) {

    }

    public void finish(Database.BatchableContext context) {

    }
}
