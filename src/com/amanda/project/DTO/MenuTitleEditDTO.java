package com.amanda.project.DTO;

public class MenuTitleEditDTO {
   private String top1;
   private String bot1;
   private String bot2;
   private String food1;
   private String foodDesc1;
   private String food2;
   private String foodDesc2;
   private String food3;
   private String foodDesc3;
   
   public MenuTitleEditDTO() {
   }
   
   public MenuTitleEditDTO(String top1, String bot1, String bot2, String food1, String foodDesc1, String food2,
         String foodDesc2, String food3, String foodDesc3) {
      super();
      this.top1 = top1;
      this.bot1 = bot1;
      this.bot2 = bot2;
      this.food1 = food1;
      this.foodDesc1 = foodDesc1;
      this.food2 = food2;
      this.foodDesc2 = foodDesc2;
      this.food3 = food3;
      this.foodDesc3 = foodDesc3;
   }
   public String getTop1() {
      return top1;
   }
   public void setTop1(String top1) {
      this.top1 = top1;
   }
   public String getBot1() {
      return bot1;
   }
   public void setBot1(String bot1) {
      this.bot1 = bot1;
   }
   public String getBot2() {
      return bot2;
   }
   public void setBot2(String bot2) {
      this.bot2 = bot2;
   }
   public String getFood1() {
      return food1;
   }
   public void setFood1(String food1) {
      this.food1 = food1;
   }
   public String getFoodDesc1() {
      return foodDesc1;
   }
   public void setFoodDesc1(String foodDesc1) {
      this.foodDesc1 = foodDesc1;
   }
   public String getFood2() {
      return food2;
   }
   public void setFood2(String food2) {
      this.food2 = food2;
   }
   public String getFoodDesc2() {
      return foodDesc2;
   }
   public void setFoodDesc2(String foodDesc2) {
      this.foodDesc2 = foodDesc2;
   }
   public String getFood3() {
      return food3;
   }
   public void setFood3(String food3) {
      this.food3 = food3;
   }
   public String getFoodDesc3() {
      return foodDesc3;
   }
   public void setFoodDesc3(String foodDesc3) {
      this.foodDesc3 = foodDesc3;
   }


}