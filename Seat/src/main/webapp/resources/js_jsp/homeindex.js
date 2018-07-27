$(function () {

	//객체생성
	/* var socket=io.connect("http://192.168.0.239:1004");
	var chatindex=0;
	id="aaa"; */
	//채팅부분    


	//서버접속시
	/*  socket.on('connect', function () {
         //최초전송할 아이디 -> 세션시 ${sessionScope.ID}
         socket.emit('init', {"id": id, "msg" : "불고기버거"});

         //메세지를 보내면 밑에 적히도록
         socket.on('subscribe', function(data) {
        		//alert(data.id=="admin");
        	 if(data.id=="admin"){
        		 $(".chatmessage").append("<div class='direct-chat-msg right'><div class='direct-chat-info clearfix'>");
                 $(".chatmessage").append("<span class='direct-chat-name float-right' id='chatid"+chatindex+"'>");
                 $(".chatmessage").append("</span><span class='direct-chat-timestamp float-left'>23Jan 2:05 pm</span></div><br/>");
                 $(".chatmessage").append("<img class='direct-chat-img' src='dist/img/user1-128x128.jpg' alt='message user image'>");
                 $(".chatmessage").append("<div class='direct-chat-text' id='chattext"+chatindex+"'> </div></div>");	
                 $('#chatid'+chatindex).prepend(data.id);
                 $('#chattext'+chatindex).prepend(data.msg+"<br/>");

        	 }else if(!(data.id=="admin")){
        		  $(".chatmessage").append("<div class='direct-chat-msg'><div class='direct-chat-info clearfix'>");
                  $(".chatmessage").append("<span class='direct-chat-name float-left' id='chatid"+chatindex+"'>");
                  $(".chatmessage").append("</span><span class='direct-chat-timestamp float-right'>23Jan 2:05 pm</span></div><br/>");
                  $(".chatmessage").append("<img class='direct-chat-img' src='dist/img/user1-128x128.jpg' alt='message user image'>");
                  $(".chatmessage").append("<div class='direct-chat-text' id='chattext"+chatindex+"'> </div></div>");	
                  $('#chatid'+chatindex).prepend(data.id);
                  $('#chattext'+chatindex).prepend(data.msg+"<br/>");
        	 }


             chatindex++;


         });
    }); */

	//버튼누를때 보내기
	$('.charSend').click(function () {
		var txt=$("#message").val();

		socket.emit('publish', {"id": id, "msg" : txt});
	});

	//소셜버튼클릭시
	$('.card__share > a').on('click', function(e){ 
		e.preventDefault() // prevent default action - hash doesn't appear in url
		$(this).parent().find( 'div' ).toggleClass( 'card__social--active' );
		$(this).toggleClass('share-expanded');
	});


	//예약하기로 이동
	$('.seatshow').on('click', function(e) {
		var id=$(this).attr("id");
		var member_id = $("#userid").val();
		
		if(!(member_id==null))
		{
			window.open(
					'homeshowseat1.do?show_no='+id, '_blank', 
					'width=800, height=755, toolbar=no, menubar=no, scrollbars=no, resizable=no, copyhistory=no'
			);
		}else{
			alert("로그인후 예약이 가능합니다!!");
			return false;
		}
	}); 


	//모듈생성
	$('.chats1').click(function() {
		$('#myModal').modal('show');
	});

	//회원가입들어가기
	$('#Usejoin').click(function() {

		window.location.href="homejoin.do";

		/* var url = $(this).attr('href');
    $(".card-body").html('<embed type="text/html", width="100%", height="755," direction=yes, location=yes, menubar=yes, scrollbars=yes, status=yes,toolbar=no, resizeble=no, src="'+url+'"></embed>');

	});   */

	});

	//로그인 클릭시
	$('#Uselogin').click(function() {
		var id=$("#id").val();
		var pw=$("#pw").val();

		$("#loginForm").submit();
	});
	
	//로그아웃클릭시
	$('#Uselogout').click(function() {
		$("#logoutForm").submit();
	});
	
	
	//Mypage 클릭시
	
	$('#UsePage').click(function() {
		window.location.href="homeMyPage1.do";
	});

});

