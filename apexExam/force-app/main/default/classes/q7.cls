
// A development team has created an Apex service and trigger with the following behavior:
// ● When an Opportunity changes to Closed Won, an Opportunity_Reward__c record is created.
// ● No Reward should be created for any other Stage.
// ● The implementation must support bulk Opportunity updates.
// ● A separate asynchronous process recalculates reward information after the records are created.
// The team currently has a test class that creates one Opportunity and only verifies that the Apex code
// executes without throwing an exception.

// a) Design the test data setup required to test this implementation without depending on existing organization
//data
//a.Ans: 



public with sharing class q7 {
    public q7() {

    }
}