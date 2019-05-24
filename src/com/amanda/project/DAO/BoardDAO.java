package com.amanda.project.DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.amanda.project.DTO.BoardDTO;
import com.amanda.project.DTO.ReplDTO;

public class BoardDAO {
	private Connection connect() throws Exception{
		Class.forName("oracle.jdbc.driver.OracleDriver");
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String user="kh";
		String pw="kh";

		Connection con = DriverManager.getConnection(url, user, pw);
		return con;
	}

	public int write(BoardDTO dto) throws Exception{				
		String sql = "insert into board values(board_seq.nextval,?,?,?,sysdate,?,?)";
		try(
				Connection con = this.connect();	
				PreparedStatement pstat = con.prepareStatement(sql);
				){
			pstat.setString(1, dto.getTitle());
			pstat.setString(2, dto.getContents());
			pstat.setString(3, dto.getWriter());
			pstat.setInt(4, dto.getViewCount());
			pstat.setString(5, dto.getIpAddr());

			int result = pstat.executeUpdate();
			con.commit();
			return result;
		}
	}
	

	
	public List<BoardDTO> selectBoard(int currentPage) throws Exception{
		String sql = "select board_seq,title,writer,writedate,viewcount from "
				+ "(select board_seq,title,writer,writedate,viewcount,rank() over(order by board_seq desc) rank from board) where rank between ? and ?";

		try(
				Connection con = this.connect();	
				PreparedStatement pstat = con.prepareStatement(sql);
				){

			int first = (currentPage-1)*10 + 1;
			int last =first+9;
			pstat.setInt(1, first);
			pstat.setInt(2, last);
			ResultSet rs = pstat.executeQuery();
			List<BoardDTO> list = new ArrayList<>();
			while(rs.next()) {			
				BoardDTO dto = new BoardDTO(rs.getString(1),rs.getString(2),rs.getString(3),rs.getTimestamp(4),rs.getInt(5));
				list.add(dto);
			}
			return list;
		}
	}
	public List<BoardDTO> searchBoard(int currentPage, String title) throws Exception{
		String sql = "select board_seq,title,writer,writedate,viewcount from "
				+ "(select board_seq,title,writer,writedate,viewcount,rank() over(order by board_seq desc) rank from board where title like ?) where rank between ? and ?";

		try(
				Connection con = this.connect();	
				PreparedStatement pstat = con.prepareStatement(sql);
				){

			int first = (currentPage-1)*10 + 1;
			int last =first+9;
			pstat.setString(1, "%"+title+"%");
			pstat.setInt(2, first);
			pstat.setInt(3, last);
			ResultSet rs = pstat.executeQuery();
			List<BoardDTO> list = new ArrayList<>();
			while(rs.next()) {			
				BoardDTO dto = new BoardDTO(rs.getString(1),rs.getString(2),rs.getString(3),rs.getTimestamp(4),rs.getInt(5));
				list.add(dto);
			}
			return list;
		}
	}

	public BoardDTO selectContents(int no) throws Exception{
		String sql1 = "select title,writer,writedate,contents from board where board_seq=?";
		String sql2 = "update board set viewcount=viewcount+1 where board_seq=?";
		try(
				Connection con1 = this.connect();	
				Connection con2 = this.connect();	
				PreparedStatement pstat1 = con1.prepareStatement(sql1);
				PreparedStatement pstat2 = con2.prepareStatement(sql2);
				){
			pstat1.setInt(1, no);
			pstat2.setInt(1, no);
			ResultSet rs = pstat1.executeQuery();
			pstat2.executeUpdate();
			con1.commit();
			con2.commit();
			if(rs.next()) {			
				BoardDTO dto = new BoardDTO(rs.getString(1),rs.getString(2),rs.getTimestamp(3),rs.getString(4).replace("&lt;script&gt","&lt$$;script$$&gt").replace("&lt;/script&gt","&lt$$;/script$$&gt"));
				return dto;
			}
			return null;
		}
	}
	
	public int update(String title, String contents, int no) throws Exception{
		String sql = "update board set title=?, contents=?, writedate=sysdate where board_seq=?";
		try(
				Connection con = this.connect();	
				PreparedStatement pstat = con.prepareStatement(sql);
				){
			pstat.setString(1, title);
			pstat.setString(2, contents);
			pstat.setInt(3, no);

			int result = pstat.executeUpdate();
			con.commit();
			return result;
		}
	}
	
	public int delete(int no)throws Exception{
		String sql = "delete from board where board_seq = ?";
		try(
				Connection con = this.connect();	
				PreparedStatement pstat = con.prepareStatement(sql);
				){
			pstat.setInt(1, no);

			int result = pstat.executeUpdate();
			con.commit();
			return result;
		}
	}
	
	private int boardCount() throws Exception{
		String sql = "select count(*) from board";
		try(
				Connection con = this.connect();	
				PreparedStatement pstat = con.prepareStatement(sql);
				){
			ResultSet rs = pstat.executeQuery();
			if(rs.next()) {			
				int count=rs.getInt(1);
				return count;
			}
			return 0;
		}
	}
	private int boardSearchCount(String title) throws Exception{
		String sql = "select count(*) from board where title=?";
		try(
				Connection con = this.connect();	
				PreparedStatement pstat = con.prepareStatement(sql);
				){
			pstat.setString(1, title);
			ResultSet rs = pstat.executeQuery();
			if(rs.next()) {			
				int count=rs.getInt(1);
				return count;
			}
			return 0;
		}
	}

	public String getNavi(int currentPage) throws Exception{

		int recordTotalCount = this.boardCount();
		int recordCountPerPage = 10;
		int naviCountPerPage = 5;
		int pageTotalCount = 0;	
		int toNext=0;
		int toPrev=0;

		if(recordTotalCount % recordCountPerPage > 0) {
			pageTotalCount = recordTotalCount / recordCountPerPage + 1;
		}else{
			pageTotalCount = recordTotalCount / recordCountPerPage;
		}

		if(currentPage < 1) {
			currentPage = 1; 
		}else if(currentPage > pageTotalCount) {
			currentPage = pageTotalCount; 
		}

		int startNavi = ((currentPage-1) / naviCountPerPage) * naviCountPerPage + 1;
		int endNavi = startNavi + (naviCountPerPage-1);;

		if(startNavi + (naviCountPerPage-1)>pageTotalCount) {
			endNavi = pageTotalCount;
		}

		boolean needPrev = true;
		boolean needNext = true;

		if(startNavi ==1) {
			needPrev = false;
		}else {
			toPrev=startNavi-1;
		}

		if(endNavi == pageTotalCount) {
			needNext = false;
		}else {
			toNext=endNavi+1;
		}

		StringBuilder sb = new StringBuilder();

		if(needPrev) {
			sb.append("<a href='Board.board?currentPage="+toPrev+"'><이전 </a>");
		}

		for(int i = startNavi; i<=endNavi; i++) {
			if(currentPage==i) {
				sb.append("<a href='Board.board?currentPage="+i+"' style='font-weight:600; text-decoration-line: underline; color:purple;'>" + i + "</a>");
				sb.append(" ");
			}else {
				sb.append("<a href='Board.board?currentPage="+i+"'>" + i + "</a>");
				sb.append(" ");
			}
		}

		if(needNext) {
			sb.append("<a href='Board.board?currentPage="+toNext+"'>다음> </a>");
		}

		return sb.toString();
	}
	
	public String getNaviSearch(int currentPage, String title) throws Exception{

		int recordTotalCount = this.boardSearchCount(title);
		int recordCountPerPage = 10;
		int naviCountPerPage = 5;
		int pageTotalCount = 0;	
		int toNext=0;
		int toPrev=0;

		if(recordTotalCount % recordCountPerPage > 0) {
			pageTotalCount = recordTotalCount / recordCountPerPage + 1;
		}else{
			pageTotalCount = recordTotalCount / recordCountPerPage;
		}

		if(currentPage < 1) {
			currentPage = 1; 
		}else if(currentPage > pageTotalCount) {
			currentPage = pageTotalCount; 
		}

		int startNavi = ((currentPage-1) / naviCountPerPage) * naviCountPerPage + 1;
		int endNavi = startNavi + (naviCountPerPage-1);;

		if(startNavi + (naviCountPerPage-1)>pageTotalCount) {
			endNavi = pageTotalCount;
		}

		boolean needPrev = true;
		boolean needNext = true;

		if(startNavi ==1) {
			needPrev = false;
		}else {
			toPrev=startNavi-1;
		}

		if(endNavi == pageTotalCount) {
			needNext = false;
		}else {
			toNext=endNavi+1;
		}

		StringBuilder sb = new StringBuilder();

		if(needPrev) {
			sb.append("<a href='BoardSearch.board?currentPage="+toPrev+"&search="+title+"'><이전 </a>");
		}

		for(int i = startNavi; i<=endNavi; i++) {
			if(currentPage==i) {
				sb.append("<a href='BoardSearch.board?currentPage="+i+"&search="+title+"' style='font-weight:600; text-decoration-line: underline; color:purple;'>" + i + "</a>");
				sb.append(" ");
			}else {
				sb.append("<a href='BoardSearch.board?currentPage="+i+"&search="+title+"'>" + i + "</a>");
				sb.append(" ");
			}
		}

		if(needNext) {
			sb.append("<a href='BoardSearch.board?currentPage="+toNext+"&search="+title+"'>다음> </a>");
		}

		return sb.toString();
	}
	
	public List<ReplDTO> selectRepl(int contents_no) throws Exception{
		String sql = "select contents_no, repl_seq, repl_writer, repl_contents, repl_time from reply where contents_no = ?";

		try(
				Connection con = this.connect();	
				PreparedStatement pstat = con.prepareStatement(sql);
				){

			pstat.setInt(1, contents_no);
			ResultSet rs = pstat.executeQuery();
			List<ReplDTO> list = new ArrayList<>();
			while(rs.next()) {			
				ReplDTO dto = new ReplDTO(rs.getInt(1),rs.getInt(2),rs.getString(3), rs.getString(4), rs.getTimestamp(5));
				list.add(dto);
			}
			return list;
		}
	}
	
	public int insertRepl(int contents_no, String id, String repl_contents) throws Exception{
		String sql = "insert into reply values(?, repl_seq.nextval, ?, ?, sysdate)";
		try(
				Connection con = this.connect();	
				PreparedStatement pstat = con.prepareStatement(sql);
				){
			pstat.setInt(1, contents_no);
			pstat.setString(2, id);
			pstat.setString(3, repl_contents);
			int result = pstat.executeUpdate();
			con.commit();
			return result;
		}
	}
	
	public int updateRepl(int repl_seq, String repl_contents) throws Exception{
		String sql = "update reply set repl_contents=?, repl_time=sysdate where repl_seq=?";
		try(
				Connection con = this.connect();	
				PreparedStatement pstat = con.prepareStatement(sql);
				){
			pstat.setString(1, repl_contents);
			pstat.setInt(2, repl_seq);

			int result = pstat.executeUpdate();
			con.commit();
			return result;
		}		
	}
	
	
	public int delRepl(int repl_seq) throws Exception{
		String sql = "delete from reply where repl_seq = ?";
		try(
				Connection con = this.connect();	
				PreparedStatement pstat = con.prepareStatement(sql);
				){
			pstat.setInt(1, repl_seq);

			int result = pstat.executeUpdate();
			con.commit();
			return result;
		}		
	}

}
