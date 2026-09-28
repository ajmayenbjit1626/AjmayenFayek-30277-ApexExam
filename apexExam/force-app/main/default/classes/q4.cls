

// a) Explain the difference between record-level access and object/field-level access in the context of this
//scenario.

//a. ans: Record-level access determines which individual records a user can see or edit, based on sharing rules and ownership. Object/field-level access controls whether a user can access
// the Customer_Assessment__c object at all, and which fields (like Internal_Comment__c) they can view or edit, regardless of record ownership.<


// b) Show how you would design the Apex class declaration and data-access operations so that the user’s
// record-level access is appropriately considered. 


//b.Ans

public with sharing class q4 {
    public static void updateApprovalStatus(List<Id> assessmentIds, String newStatus) {
        
        List<Customer_Assessment__c> assessments = [SELECT Id, Approval_Status__c FROM Customer_Assessment__c WHERE Id IN :assessmentIds];
        for (Customer_Assessment__c ca : assessments) {
            ca.Approval_Status__c = newStatus;
        }
        update assessments;
        
        }
}


// c) Describe how CRUD and field-level security should be enforced when querying or updating the fields used
// by this service. Include appropriate modern Apex security mechanisms where relevant.

//C.Ans: CRUD and field-level security should be enforced using security stripInaccessible and with security checks like Schema.
//sObjectType.Customer_Assessment__c.is Accessible(), and by using Security.stripInaccessible to remove inaccessible fields from queried or updated records.    
// Security.stripInaccessible(AccessType.READABLE, assessments);
// Security.stripInaccessible(AccessType.UPDATABLE, assessments);       

// d) Assume the class currently executes its query and DML operations without considering the running user’s
// access. Identify the security risks this creates and describe how you would redesign the service securely.


//d.Ans: If the class does not consider the running user's access, users may view or update records and fields they should not have access to, violating data security.
// To redesign securely, check object and field-level access with Schema methods before querying/updating, and use Security.stripInaccessible to filter inaccessible fields after queries.