// This class contains test methods with different data access levels.
@isTest
private class ClassWithDifferentDataAccess {

    // Test method that has access to all data.
    @isTest(SeeAllData=true)
    static void testWithAllDataAccess() {
        // Can query all data in the organization.      
    }
    
    // Test method that has access to only the data it creates
    // and organization setup and metadata objects.
    @isTest static void testWithOwnDataAccess() {
        // This method can still access the User object.
        // This query returns the first user object.
        User u = [SELECT UserName,Email FROM User LIMIT 1]; 
        System.debug('UserName: ' + u.UserName);
        System.debug('Email: ' + u.Email);
        
        // Can access the test account that is created here.
        Account a = new Account(Name='Test Account');
        insert a;      
        // Access the account that was just created.
        Account insertedAcct = [SELECT Id,Name FROM Account 
                                WHERE Name='Test Account'];
        System.assert(insertedAcct != null);
    }
}