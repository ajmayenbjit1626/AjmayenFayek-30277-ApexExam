


// a) Write the Validation Rule formula that prevents an Opportunity from being saved as Closed Won when
// Amount is blank or not greater than zero. 

// a. Ans:
// AND(
//     ISPICKVAL(StageName, "Closed Won"),
//     OR(
//         ISBLANK(Amount),
//         Amount <= 0
//     )
// )



//b) Describe the relevant sequence of processing for the automation listed in the scenario, including the
//Validation Rule, before-save automation, before trigger, after trigger, and later record automation. 

//b.Ans: 
// 1. User initiates DML operation (insert/update Opportunity)
// 2. Validation Rules are evaluated first; if the rule fails, the record is not saved.
// 3. Before-save Flow executes next, updating Business_Category__c. Then, the before update Apex trigger runs to calculate Risk_Level__c. After triggers fire next,

//c) Explain why an Apex trigger may execute more than once during what the user considers a single save
//operation, and describe the possible impact on the audit-record creation logic.

//C.Ans: This can happen if automation (such as Flows, Process Builder, or workflow rules) performs a DML update to the same Opportunity record after the initial save
// automation. This causes the trigger to re-fire, and if the audit logic does not check for prior audit records or stage changes, duplicate Opportunity_Stage_Audit__c records may be created.


//d) Design an approach that prevents duplicate audit creation while still correctly detecting genuine Stage
//changes using the available trigger context data.

//d.Ans: We should compare Trigger.oldMap and Trigger.newMap to detect genuine Stage changes, and before inserting an audit record, check if an audit was already created for the
// same Opportunity and Stage in this transaction. Use a Set to track processed Opportunities, and only insert an audit if the Stage actually changed and no audit exists for thatcombination in this transaction.


public with sharing class q3 {
    public q3() {

    }
}