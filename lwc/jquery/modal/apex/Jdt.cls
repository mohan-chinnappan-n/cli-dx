// jdt.cls
public with sharing class Jdt {
    // To cache data returned from an Apex method for any component with an API version of 44.0 or higher, 
    //  you must annotate the Apex method with @AuraEnabled(cacheable=true). 
    // To set cacheable=true, a method must only get data. It can’t mutate data.
    @AuraEnabled(cacheable=true) 
    public static list <Opportunity> getOpptys() {
       return [SELECT Name,Type,StageName,Amount,CloseDate
               FROM Opportunity LIMIT 500];
     }   
}
