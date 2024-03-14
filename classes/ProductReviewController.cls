public class ProductReviewController {
  public Product2 product;
  public Review__c review { get; set; }
  public ProductReviewController(ApexPages.StandardController controller) {
    product = (Product2) controller.getRecord();
    review = new Review__c(Product__c=product.Id);
  }
  public void saveReview() {
    insert review;
    // update product average rating
    List<Review__c> reviews = [SELECT Rating__c FROM Review__c WHERE Product__c=:product.Id];
    if (reviews.size() > 0) {
      Decimal totalRating = 0;
      for (Review__c r : reviews) {
        totalRating += Integer.valueOf(r.Rating__c);
      }
      Decimal avgRating = totalRating / reviews.size();
      product.AverageRating__c = avgRating;
      update product;
    }
  }
}