<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- 좋아요아이콘 -->
<meta name='viewport' content='width=device-width, initial-scale=1'>
<script src='https://kit.fontawesome.com/a076d05399.js'></script>

<script>
 var nno = '${dto.nno}'; //뉴스글번호
 var id = '${login.id}';
 var rep_cnt = '${dto.rep_cnt}'; //댓글개수

//댓글개수리프레쉬 =============================
function refresh_rep_cnt(){
	var a = rep_cnt;
	var b = '댓글 '+rep_cnt+'개';
	$('.rep_cnt_main').html(a);	
	$('.panel-heading').html(b);	
	 }
 
//댓글 목록 =====================================
function commentList(){
	$.ajax({
		url: '/ncomment/list.do',
		type: 'get',
		data: {'nno':nno, 'id':id}, //로그인안되어있으면 id 아무것도 안넘어간다.
		success: function(data){
			//받아오는 데이터: nclist, nclikelist 두개 map으로.
			var a = '';
			//댓글리스트
			var nclist = data.nclist;
			//내가좋아요/싫어요한댓글리스트
			var nclikelist = data.nclikelist;	

			$.each(nclist, function(key, value){
				var thumbsup = 'far fa-thumbs-up';
				var thumbsdown = 'far fa-thumbs-down';

				//내가좋아요/싫어요한 댓글이 있으면
				if(nclikelist!=undefined){
					$.each(nclikelist, function(k, v){
						//내가좋아/싫어한댓글과 리스트에 뿌려진 댓글이 같고, 좋아요/싫어요한아이디와 로그인한아이디가 같으면
						if (v.rno==value.rno && id==v.id){
							if(v.likeDislike==0){//이미좋아요
								thumbsup = 'fas fa-thumbs-up'; //색깔채운손가락
    	                	}else if(v.likeDislike == 1){//이미싫어요
    	               			thumbsdown = 'fas fa-thumbs-down';
    	               		}
						}
					})
				}
			//----------------------
	            a += '<div class="media"><a href="#" class="pull-left"><img src="'+value.photo+'" onerror="/upload/news/invester.png" class="img-circle"></a>';
                a += '<div class="media-body">';
                a += '<span class="text-muted pull-right"><small class="text-muted">'+value.write_date+'</small></span></br>'

                //자기가 쓴댓글이면 수정삭제버튼이보인다.
                if (id == value.id){
                a += '<div style="float:right;">';
                a += '<a onclick="commentUpdate('+value.rno+',\''+value.content+'\');"> update </a>';
                a += '<a onclick="commentDelete('+value.rno+');"> delete </a>';
                a += '</div>';
                }

                a += '<strong class="text-success">'+value.nickName+'</strong>'
                a += '<div class="commentContent'+value.rno+'">'+value.content+'</div>'
                a += '<p><i id="thumbsup" class="'+thumbsup+'" style=\'font-size:13px\' onclick="increaseLike('+value.rno+')">'+value.like_cnt+'</i> '
                a += '<i id="thumbsdown" class="'+thumbsdown+'" style=\'font-size:13px\' onclick="increaseDislike('+value.rno+')">'+value.dislike_cnt+'</i></p>'
                a += '</div></div></div></div></div>';
				
			});
		$('.commentList').html(a);	
		}
	});
}


//댓글 등록===================================================
function commentInsert(insertData){
  $.ajax({
      url : '/ncomment/insert.do',
      type : 'POST',
      data : insertData,
      success : function(response){ //요청성공시
          if(response == 1) {
            refresh_rep_cnt();//댓글개수 리로드
        	commentList(); //댓글목록 리로드 
            $('[name=content]').val(''); //댓글창에 쓴 내용 사라짐
          }
      }
  });
}
//댓글등록버튼클릭시 로그인안되어있으면 로그인페이지로, 
$('[name=commentInsertBtn]').click(function(){ //댓글 등록 버튼 클릭시 
	//alert('test');
	if (id==null){
		//다른컨트롤러로 보내려면 앞에 /슬래시붙여야함(루트의미)
		location.replace('/member/login.do')
		}
  var insertData = $('[name=commentInsertForm]').serialize(); //commentInsertForm의 내용을 가져와서 serialize직렬화해서 json으로 만들어서 보내준다.
  commentInsert(insertData); //Insert 함수호출(아래)
  
});

//댓글 수정===============================
//기존 댓글 보여주기 
function commentUpdate(rno, content){
  var a ='';
  
  a += '<div class="input-group">';
  a += '<input type="text" class="form-control" name="content_'+rno+'" value="'+content+'"/>';
  a += '<span class="input-group-btn"><button class="btn btn-default" type="button" onclick="commentUpdateProc('+rno+');">update</button> </span>';
  a += '</div>';
  
  $('.commentContent'+rno).html(a); //댓글번호에해당하는 기존댓글을 input창에 뿌린다. 
  
}

//댓글 수정 보내기
function commentUpdateProc(rno){
  var updateContent = $('[name=content_'+rno+']').val(); //수정한글내용
  
  $.ajax({
      url : '/ncomment/update.do',
      type : 'post',
      data : {'content' : updateContent, 'rno' : rno},
      success : function(data){
          if(data == 1) commentList(); //댓글 수정후 목록 출력 
      }
  });
}

//댓글 삭제 ==================================================
function commentDelete(rno){
  $.ajax({
      url : '/ncomment/delete/'+rno+'.do',
      type : 'post',
      success : function(data){
          if(data == 1){ 
          	refresh_rep_cnt();//댓글개수 리로드
            commentList(); //댓글목록 리로드 
          }
      }
  });
}

 
//좋아요클릭시==================================================
function increaseLike(rno){
	//로그인안되어있으면 el객체 null이라 오류남.-> null변수 먼저 선언해주고, 대입. 쌍따옴표로 묶어야 한다.
	var id = null;
	id = "${login.id}";
	if (!id){
		//alert("This service requires sign-in.");
		location.href="/member/login.do";
		}
	else{
	
	//1.좋아요누른사람등록
	$.ajax({
		url : '/ncomment/increaselike.do',
		method : 'post',
		contentType: 'application/json', //json으로 넘기고 vo,dto가 아닌 map으로 받으면 이 문구를 넣어줘야 에러가 안나고 이름 맵핑된다.
		data : JSON.stringify({ 
			id : id,
			nno : ${dto.nno},
			rno : rno,
			likeDislike : 0 //좋아요는 0, 싫어요는 -1보내기(총개수구하는용)
			}),
		success : function(response){ //리턴값 1: 좋아요 성공, 2: 이미좋아요(좋아요캔슬), 3: 이미싫어요(팝업창)
			//alert(response);
            if(response == 1) { 
                $('.thumbsup').attr('class', 'fas fa-thumbs-up');
                commentList(); //댓글 작성 후 댓글 목록 reload
            	}
            else if(response==2){ //이미좋아요->좋아요취소
                commentList(); //댓글 작성 후 댓글 목록 reload
            }          
            else{
				alert('The comment is already disliked.');
                }
        	}	
		
	});
	}
}

//싫어요 클릭시:===========================================
function increaseDislike(rno){
	//로그인안되어있으면 el객체 null이라 오류남.-> null변수 먼저 선언해주고, 대입. 쌍따옴표로 묶어야 한다.
	var id = null;
	id = "${login.id}";
	if (!id){
		alert("This service requires sign-in.");
		location.href="/member/login.do";
		}
	else{

	$.ajax({
		url : '/ncomment/increaselike.do',
		method : 'post',
		contentType: 'application/json', //json으로 넘기고 vo,dto가 아닌 map으로 받으면 이 문구를 넣어줘야 에러가 안나고 이름 맵핑된다.
		data : JSON.stringify({ 
			id : id,
			nno : ${dto.nno},
			rno : rno,
			likeDislike : 1 //좋아요는 0, 싫어요는 1보내기(총개수구하는용)
			}),
		success : function(response){ //리턴값 1: 싫어요 성공, 2: 이미좋아요, 3: 이미싫어요(싫어요취소)
            if(response == 1) { //싫어요 성공
                //commentList(), // 댓글 목록 reload
                //thumbsup = "fas fa-thumbs-down";
                //document.getElementByClassName("far fa-thumbs-down").className = "fas fa-thumbs-down";
                //$(this).className = "fas fa-thumbs-down";
                $(this).attr('class', 'fas fa-thumbs-down');
                commentList(); //댓글 작성 후 댓글 목록 reload
            	}
            else if(response==2){ //이미좋아요
                alert("The comment is already liked.");
                }
            else{//싫어요취소
                $('.thumbsdown').attr('class', 'fas fa-thumbs-down');
                commentList(); //댓글 작성 후 댓글 목록 reload
                }
        	}	
		
	});
	}
}








//페이지 로딩시 뿌려준다. ========================
$(document).ready(function(){
	refresh_rep_cnt(); //댓글개수
    commentList(); //댓글리스트 
});




 </script>