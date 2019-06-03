package com.amanda.project.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.amanda.project.DTO.ChartDTO;

public class ChartDAO {
	DataSource ds;
	public ChartDAO() {
		Context ctx;
		try {
			ctx = new InitialContext();
			Context env = (Context)ctx.lookup("java:/comp/env");
			this.ds = (DataSource)env.lookup("jdbc");
		} catch (NamingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}
	public Connection db_connect() throws Exception {
		return ds.getConnection();
	}

	public int daily_sell(int day){
		String sql="select sum(pay_ammount) from point_charge where time between trunc(sysdate-?) and sysdate-?";
		try (	Connection con=ds.getConnection();
				PreparedStatement pstat=con.prepareStatement(sql);

				)
		{
			pstat.setInt(1, day );
			pstat.setInt(2, day );
			ResultSet rs=pstat.executeQuery();
			rs.next();
			
			int result = rs.getInt(1);			
			return result;
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	public int monthly_sell(int month){
		String sql="select sum(pay_ammount) from point_charge where time between add_months(last_day(sysdate) ,?-1)+1 and  last_day(add_months(sysdate,?))";
		try (	Connection con=ds.getConnection();
				PreparedStatement pstat=con.prepareStatement(sql);

				)
		{
			pstat.setInt(1, -month );
			pstat.setInt(2, -month );
			ResultSet rs=pstat.executeQuery();
			rs.next();
			
			int result = rs.getInt(1);			
			return result;
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	public List<ChartDTO> user_sell(){
		String sql="select sum(pay_ammount) ,user_id from point_charge group by user_id order by sum(pay_ammount) desc";
		List<ChartDTO> arr = new ArrayList();
		try (	Connection con=ds.getConnection();
				PreparedStatement pstat=con.prepareStatement(sql);

				)
		{
			ResultSet rs=pstat.executeQuery();
			while(rs.next()){
				arr.add(new ChartDTO(rs.getString(2),rs.getInt(1)));
			}
			return arr;
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	public List<ChartDTO> name_sell(){
		String sql="select sum(pay_ammount) ,pay_name from point_charge group by pay_name order by sum(pay_ammount) desc";
		List<ChartDTO> arr = new ArrayList();
		try (	Connection con=ds.getConnection();
				PreparedStatement pstat=con.prepareStatement(sql);

				)
		{
			ResultSet rs=pstat.executeQuery();
			while(rs.next()){
				arr.add(new ChartDTO(rs.getString(2),rs.getInt(1)));
			}
			return arr;
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return null;
	}
}
