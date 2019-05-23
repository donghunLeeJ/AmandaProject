<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" ></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" >
        </script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" >
        </script>
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">
        <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=8a509352a06e97740ccf9a876e281f48"></script>
<style>
		
		#remember{
			width: 35%;
			height: 100%;
			margin: 0px;
		}
		.modal-footer{
		
			box-sizing: border-box;
		}
		#addcoin{
			
		}
		.modal-body1{
		padding:1px;
		}
		.card-header{
			color: gray;
			background-color: #bbe3e3;
		}
		.card-text{
			text-align: left;
			
		}
	
		</style>
</head>
<body>
<!--                                       마이페이지-->
                                        <button type="button" class="btn btn-outline-danger signbt mb-2" data-toggle="modal" data-target="#exampleModal" id="mypagebtn"> mypage   </button>
                                        <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">

                                            <div class="modal-dialog" role="document">
                                                <div class="modal-content">

                                                    <div class="modal-body1">
                                                        <form>
                                                            <div class="form-group m-0 p-0">
                           <div class="card">
                            <div class="card-header">
                                <i class="fa fa-user"></i><strong class="card-title pl-2">
                                	My Page
                                </strong>
                            </div>
                            <div class="card-body">
                                <div class="mx-auto d-block" >
                                    <img class="rounded-circle mx-auto d-block" src="profile.jpg" alt="profile image" width="80px">
                                    <h5 class="text-center mt-2 mb-1">Steven Lee</h5>
                                    <div class="location text-center">Lv. 일반회원</div>
                                </div>
                                <hr>
                                <div class="card-text">
									<pre> <b>이름 </b> <p> </p></pre>                 
									<pre> <b>생년월일</b><p> </p></pre>         
									<pre> <b>이메일</b><p></p> </pre>  
									<pre> <b>핸드폰번호</b><p> </p></pre>             
                                    <pre> <b>잔여포인트</b><p> </p></pre> 
                                </div>
                            </div>
                        </div>               </div>
                          
                                                            <div class="modal-footer">
                                                              <button type="button" class="btn btn-outline-info" data-dismiss="modal" >포인트 충전</button>
                                                               <button type="button" class="btn btn-outline-info" data-dismiss="modal">정보수정</button>
                                                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                                              
                                                            </div>
                                                        </form>
                                                    </div>

                                                </div>
                                            </div>
                                        </div>
                                        
                                 <!--                                       로그인-->       
<!--                                        <button type="button" class="btn btn-outline-danger signbt mb-2" data-toggle="modal" data-target="#exampleModal1" id="loginbtn"> login   </button>-->
                                          <a href="#" class="active" data-toggle="modal" aria-haspopup="true" aria-expanded="false"  data-target="#exampleModal1">
                            <img class="user-avatar rounded-circle" src="profile.jpg" alt="profile" width="50px"></a>
                                        
                                        
                                        <div class="modal fade" id="exampleModal1" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                            <div class="modal-dialog" role="document">
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <h5 class="modal-title" id="exampleModalLabel">L O G I N </h5>
                                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                            <span aria-hidden="true">&times;</span>
                                                        </button>
                                                    </div>
                                                    <div class="modal-body">
                                                        <form>
                                                            <div class="form-group">
                                                                <label for="exampleFormControlInput1">ID</label>
                                                                <input type="text" class="form-control" id="joinemail" placeholder="ID를 입력하시오" required>
                                                            </div>
                                                            
                                                            <div class="form-group">
                                                                <label for="exampleFormControlInput1">Password</label>
                                                                <input type="password" class="form-control" id="joinpassword" placeholder="비밀번호 입력하시오" required>
                                                            </div>
                                                            
                                                                                                                     
                                                            <div class="modal-footer">
																<div id="remember">   <input type="checkbox">자동로그인 </div>
                                                               <button type="button" class="btn btn-primary" data-dismiss="modal">회원가입</button>                                                
                                                               <button type="submit" class="btn btn-primary">login</button>
                                                             <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                                            </div>
                                                        </form>
                                                    </div>

                                                </div>
                                            </div>
                                        </div>
</body>
</html>