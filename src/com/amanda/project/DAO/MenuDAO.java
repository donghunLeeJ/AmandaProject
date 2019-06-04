package com.amanda.project.DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.amanda.project.DTO.MenuDTO;
import com.amanda.project.DTO.MenuTitleDTO;
import com.amanda.project.DTO.MenuTitleEditDTO;

public class MenuDAO {
	private Connection connect() throws Exception{
		Class.forName("oracle.jdbc.driver.OracleDriver");
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String user="kh";
		String pw="kh";

		Connection con = DriverManager.getConnection(url, user, pw);
		return con;
	}
	public List<MenuDTO> selectMenu() throws Exception{
		String sql = "select * from menu";

		try(
				Connection con = this.connect();	
				PreparedStatement pstat = con.prepareStatement(sql);
				){
			ResultSet rs = pstat.executeQuery();
			List<MenuDTO> list = new ArrayList<>();
			while(rs.next()) {			
				MenuDTO dto = new MenuDTO(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5),rs.getInt(6));
				list.add(dto);
			}
			return list;
		}
	}
	
	public String selectImgPath(String menuName) throws Exception{
		String sql = "select imgPath from menu where menuName = ?";

		try(
				Connection con = this.connect();	
				PreparedStatement pstat = con.prepareStatement(sql);
				){
			
			pstat.setString(1, menuName);
			ResultSet rs = pstat.executeQuery();
			String imgPath = null;
			if(rs.next()) {			
				imgPath = rs.getString(1);
			}
			return imgPath;
		}
	}
	
	public List<MenuTitleDTO> selectFood() throws Exception{
		String sql = "select * from menuTitle where menuKind like 'food%'";

		try(
				Connection con = this.connect();	
				PreparedStatement pstat = con.prepareStatement(sql);
				){
			ResultSet rs = pstat.executeQuery();
			List<MenuTitleDTO> list = new ArrayList<>();
			while(rs.next()) {	
				MenuTitleDTO dto = new MenuTitleDTO(rs.getString(1),rs.getString(2),rs.getString(3));
				list.add(dto);
			}
			return list;
		}
	}
		
	public List<String> selectDesc() throws Exception{
		String sql = "select menuContent from menuTitle where menuKind='desc' order by menuName";

		try(
				Connection con = this.connect();	
				PreparedStatement pstat = con.prepareStatement(sql);
				){
			ResultSet rs = pstat.executeQuery();
			List<String> list = new ArrayList<>();
			while(rs.next()) {			
				list.add(rs.getString(1));
			}
			return list;
		}
	}
	
	public int menuHeaderUpdate(MenuTitleEditDTO dto) throws Exception{
		String sql1 = "update menuTitle set menuName=?, menuContent=? where menuKind = 'food1'";
		String sql2 = "update menuTitle set menuName=?, menuContent=? where menuKind = 'food2'";
		String sql3 = "update menuTitle set menuName=?, menuContent=? where menuKind = 'food3'";
		String sql4 = "update menuTitle set menuContent=? where menuName = '1top'";
		String sql5 = "update menuTitle set menuContent=? where menuName = '2bot'";
		String sql6 = "update menuTitle set menuContent=? where menuName = '3bot'";
		try(
				Connection con1 = this.connect();	
				Connection con2 = this.connect();
				Connection con3 = this.connect();
				Connection con4 = this.connect();
				Connection con5 = this.connect();
				Connection con6 = this.connect();
				PreparedStatement pstat1 = con1.prepareStatement(sql1);
				PreparedStatement pstat2 = con1.prepareStatement(sql2);
				PreparedStatement pstat3 = con1.prepareStatement(sql3);
				PreparedStatement pstat4 = con1.prepareStatement(sql4);
				PreparedStatement pstat5 = con1.prepareStatement(sql5);
				PreparedStatement pstat6 = con1.prepareStatement(sql6);
				){
			
			pstat1.setString(1, dto.getFood1());
			pstat1.setString(2, dto.getFoodDesc1());
			pstat2.setString(1, dto.getFood2());
			pstat2.setString(2, dto.getFoodDesc2());
			pstat3.setString(1, dto.getFood3());
			pstat3.setString(2, dto.getFoodDesc3());
			pstat4.setString(1, dto.getTop1());
			pstat5.setString(1, dto.getBot1());
			pstat6.setString(1, dto.getBot2());

			int result1 = pstat1.executeUpdate();
			int result2 = pstat2.executeUpdate();
			int result3 = pstat3.executeUpdate();
			int result4 = pstat4.executeUpdate();
			int result5 = pstat5.executeUpdate();
			int result6 = pstat6.executeUpdate();
			
			con1.commit();
			con2.commit();
			con3.commit();
			con4.commit();
			con5.commit();
			con6.commit();
			
			return result1+result2+result3+result4+result5+result6;
		}
	}
		
	public int menuAdd(MenuDTO dto) throws Exception{				
		String sql = "insert into menu values(menu_seq.nextval,?,?,?,?,?)";
		try(
				Connection con = this.connect();	
				PreparedStatement pstat = con.prepareStatement(sql);
				){
			pstat.setString(1, dto.getImgPath());
			pstat.setString(2, dto.getRealPath());
			pstat.setString(3, dto.getMenuName());
			pstat.setString(4, dto.getMenuDesc());
			pstat.setInt(5, dto.getMenuPrice());

			int result = pstat.executeUpdate();
			con.commit();
			return result;
		}
	}
	
	public int menuUpdateAll(MenuDTO dto) throws Exception{
		String sql = "update menu set imgPath=?, realPath=?, menuName=?, menuDesc=?, menuPrice=? where menu_seq=?";
		try(
				Connection con = this.connect();	
				PreparedStatement pstat = con.prepareStatement(sql);
				){
			pstat.setString(1, dto.getImgPath());
			pstat.setString(2, dto.getRealPath());
			pstat.setString(3, dto.getMenuName());
			pstat.setString(4, dto.getMenuDesc());
			pstat.setInt(5, dto.getMenuPrice());
			pstat.setInt(6, dto.getMenu_seq());

			int result = pstat.executeUpdate();
			con.commit();
			return result;
		}
	}
	
	public int menuUpdatePart(MenuDTO dto) throws Exception{
		String sql = "update menu set menuName=?, menuDesc=?, menuPrice=? where menu_seq=?";
		try(
				Connection con = this.connect();	
				PreparedStatement pstat = con.prepareStatement(sql);
				){

			pstat.setString(1, dto.getMenuName());
			pstat.setString(2, dto.getMenuDesc());
			pstat.setInt(3, dto.getMenuPrice());
			pstat.setInt(4, dto.getMenu_seq());

			int result = pstat.executeUpdate();
			con.commit();
			return result;
		}
	}
	
	public int menuDel(int menu_seq) throws Exception{
		String sql = "delete from menu where menu_seq=?";
		try(
				Connection con = this.connect();	
				PreparedStatement pstat = con.prepareStatement(sql);
				){
			pstat.setInt(1, menu_seq);
			int result = pstat.executeUpdate();
			con.commit();
			return result;
		}
	}
	
	
}
