package com.amanda.project.DTO;

public class MenuDTO {

   private int menu_seq;
   private String imgPath;
   private String realPath;
   private String menuName;
   private String menuDesc;
   private int menuPrice;
   public MenuDTO(int menu_seq, String imgPath, String realPath, String menuName, String menuDesc, int menuPrice) {
      super();
      this.menu_seq = menu_seq;
      this.imgPath = imgPath;
      this.realPath = realPath;
      this.menuName = menuName;
      this.menuDesc = menuDesc;
      this.menuPrice = menuPrice;
   }
   public MenuDTO() {
   }
   public int getMenu_seq() {
      return menu_seq;
   }
   public void setMenu_seq(int menu_seq) {
      this.menu_seq = menu_seq;
   }
   public String getImgPath() {
      return imgPath;
   }
   public void setImgPath(String imgPath) {
      this.imgPath = imgPath;
   }
   public String getRealPath() {
      return realPath;
   }
   public void setRealPath(String realPath) {
      this.realPath = realPath;
   }
   public String getMenuName() {
      return menuName;
   }
   public void setMenuName(String menuName) {
      this.menuName = menuName;
   }
   public String getMenuDesc() {
      return menuDesc;
   }
   public void setMenuDesc(String menuDesc) {
      this.menuDesc = menuDesc;
   }
   public int getMenuPrice() {
      return menuPrice;
   }
   public void setMenuPrice(int menuPrice) {
      this.menuPrice = menuPrice;
   }   

}

