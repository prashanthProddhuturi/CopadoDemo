public with sharing class ProductController {
    @AuraEnabled(cacheable=true)
    public static List<Product2> getProducts() {
        return [SELECT Id, Name,Category__c,Description,Duration_in_Min__c,AverageRating__c,testImg__c FROM Product2 where Category__c !=Null];
        
    }
}