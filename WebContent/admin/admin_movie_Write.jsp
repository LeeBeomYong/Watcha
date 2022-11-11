<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
  <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
          <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        
        <title>영화등록</title>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script> 
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script> 
        <style type="text/css">
        
        
        *, *:before, *:after {
  -moz-box-sizing: border-box;
  -webkit-box-sizing: border-box;
  box-sizing: border-box;
}


body {
  font-family: 'Nunito', sans-serif;
  color: #384047;
  clear: both;
}

form {
  max-width: 300px;
  margin: 10px auto;
  padding: 10px 20px;
  background: #f4f7f8;
  border-radius: 8px;
}

h1 {
  margin: 0 0 30px 0;
  text-align: center;
}

input[type="text"],
input[type="password"],
input[type="date"],
input[type="datetime"],
input[type="email"],
input[type="number"],
input[type="search"],
input[type="tel"],
input[type="time"],
input[type="url"],
textarea,
select {
  background: rgba(255,255,255,0.1);
  border: none;
  font-size: 16px;
  height: auto;
  margin: 0;
  outline: 0;
  padding: 15px;
  width: 100%;
  background-color: #e8eeef;
  color: #8a97a0;
  box-shadow: 0 1px 0 rgba(0,0,0,0.03) inset;
  margin-bottom: 30px;
  resize: none;
}



select {
  padding: 6px;
  height: 32px;
  border-radius: 2px;
}

button {
  padding: 19px 39px 18px 39px;
  color: #FFF;
  background-color: #4bc970;
  font-size: 18px;
  text-align: center;
  font-style: normal;
  border-radius: 5px;
  width: 100%;
  border: 1px solid #3ac162;
  border-width: 1px 1px 3px;
  box-shadow: 0 -1px 0 rgba(255,255,255,0.1) inset;
  margin-bottom: 10px;
}
 
button{
  background:#4bc970;
  color:#fff;
  border:none;
  position:relative;
  height:60px;
  font-size:1.6em;
  padding:0 2em;
  cursor:pointer;
  transition:800ms ease all;
  outline:none;
}
button:hover{
  background:#fff;
  color:#1AAB8A;
}
button:before,button:after{
  content:'';
  position:absolute;
  top:0;
  right:0;
  height:2px;
  width:0;
  background: #1AAB8A;
  transition:400ms ease all;
}
button:after{
  right:inherit;
  top:inherit;
  left:0;
  bottom:0;
}
button:hover:before,button:hover:after{
  width:100%;
  transition:800ms ease all;
}

fieldset {
  margin-bottom: 30px;
  border: none;
}

legend {
  font-size: 1.4em;
  margin-bottom: 10px;
}

label {
  display: block;
  margin-bottom: 8px;
}

label.light {
  font-weight: 300;
  display: inline;
}

.number {
  background-color: #5fcf80;
  color: #fff;
  height: 30px;
  width: 30px;
  display: inline-block;
  font-size: 0.8em;
  margin-right: 4px;
  line-height: 30px;
  text-align: center;
  text-shadow: 0 1px 0 rgba(255,255,255,0.2);
  border-radius: 100%;
}
.can-1{
margin-left: 80px
}
.can-1,.can1-1{
float: left;

}
.can1-1{
margin-top: 100px;
}
.can-2{
clear: both;
}
.can-3{
float: left;
}

@media screen and (min-width: 480px) {

  form {
    max-width: 900px;
  }

}
    
 /* --------------------------------------- */   




.upload {
  &__box {
    padding: 40px;
  }
  &__inputfile {
    width: .1px;
    height: .1px;
    opacity: 0;
    overflow: hidden;
    position: absolute;
    z-index: -1;
  }
  
  &__btn {
    display: inline-block;
    font-weight: 600;
    color: #fff;
    text-align: center;
    min-width: 116px;
    padding: 5px;
    transition: all .3s ease;
    cursor: pointer;
    border: 2px solid;
    background-color: #4045ba;
    border-color: #4045ba;
    border-radius: 10px;
    line-height: 26px;
    font-size: 14px;
    
    &:hover {
      background-color: unset;
      color: #4045ba;
      transition: all .3s ease;
    }
    
    -box {
      margin-bottom: 10px;
    }
  }
  
  __img {
    -wrap {
      display: flex;
      flex-wrap: wrap;
      margin: 0 -10px;
    }
    
    &-box {
      width: 200px;
      padding: 0 10px;
      margin-bottom: 12px;
    }
    
    &-close {
        width: 24px;
        height: 24px;
        border-radius: 50%;
        background-color: rgba(0, 0, 0, 0.5);
        position: absolute;
        top: 10px;
        right: 10px;
        text-align: center;
        line-height: 24px;
        z-index: 1;
        cursor: pointer;

        &:after {
          content: '\2716';
          font-size: 14px;
          color: white;
        }
      }
  }
}

.img-bg {
  background-repeat: no-repeat;
  background-position: center;
  background-size: cover;
  position: relative;
  padding-bottom: 100%;
} 

/* --------------------------------------------- */
.ui-sortable-placeholder { 
    	border: 1px dashed black!important; 
        visibility: visible !important;
        background: #eeeeee78 !important;
       }
    .ui-sortable-placeholder * { visibility: hidden; }
        .RearangeBox.dragElemThumbnail{opacity:0.6;}
        .RearangeBox {
            width: 180px;
            height:300px;
            padding:10px 5px;
            cursor: all-scroll;
            float: left;
            border: 1px solid #9E9E9E;
            font-family: sans-serif;
            display: inline-block;            
            margin: 5px!important;
            text-align: center;
            color: #673ab7;
            background: #ffc107;
          /*color: rgb(34, 34, 34);
            background: #f3f2f1;     */
        }




body{
  font-family: sans-serif;
 margin: 0px;
}

.IMGthumbnail{
    max-width:168px;
    height:220px;
    margin:auto;
  background-color: #ececec;
  padding:2px;
  border:none;
}

.IMGthumbnail img{
   max-width:100%;
max-height:100%;
}

.imgThumbContainer{

  margin:4px;
  border: solid;
  display: inline-block;
  justify-content: center;
    position: relative;
    border: 1px solid rgba(0,0,0,0.14);
  -webkit-box-shadow: 0 0 4px 0 rgba(0,0,0,0.2);
    box-shadow: 0 0 4px 0 rgba(0,0,0,.2);
}



.imgThumbContainer > .imgName{
  text-align:center;
  margin-top:4px;
  font-size:13px;
  height: 15px;
  overflow: hidden;
}

.imgThumbContainer > .imgRemoveBtn{
    position: absolute;
    color: #e91e63ba;
    right: 2px;
    top: 2px;
    cursor: pointer;
    display: none;
}

.RearangeBox:hover > .imgRemoveBtn{ 
    display: block;
}
.rightfield{
width: 260px;

}
.leftfield{
float: left;
width: 260px;

}
.img_no{
height: 111px;
width: 139px;
margin-right: 100px;
}
.center{

margin-top: 100px;
}
.image_gallery{
width: 130px;
height: 180px;

}
.button-wrapper {
  position: relative;
  width: 150px;
  text-align: center;
  margin: 20% auto;
}

.button-wrapper span.label {
  position: relative;
  z-index: 0;
  display: inline-block;
  width: 100%;
  background: #00bfff;
  cursor: pointer;
  color: #fff;
  padding: 10px 0;
  text-transform:uppercase;
  font-size:12px;
}

#upload {
    display: inline-block;
    position: absolute;
    z-index: 1;
    width: 100%;
    height: 50px;
    top: 0;
    left: 0;
    opacity: 0;
    cursor: pointer;
} 
        </style>
        <link rel="stylesheet" href="css/normalize.css">
        <link href='https://fonts.googleapis.com/css?family=Nunito:400,300' rel='stylesheet' type='text/css'>
        <link rel="stylesheet" href="css/main.css">
    </head>
    
    <body>
	<jsp:include page="../include/admin_top.jsp" />
	<br><br><br>
      <form enctype="multipart/form-data" action="<%=request.getContextPath() %>/admin_movie_write_ok.do" method="post">
      
      <input type="hidden" id="mm" name="movie_main" value= "">
      <input type="hidden" id ="gallery1" name="movie_gallery1" value = "">
      <input type="hidden" id = "gallery2" name="movie_gallery2" value = "">
     
    
        <h1>영화등록</h1>

    <script defer="defer">
	
	let noimage =
	  "https://ami-sni.com/wp-content/themes/consultix/images/no-image-found-360x250.png";
	$(function() {
       	$('#id').click(function(){
            var files=$('input[name="gallery"]')[0].files;
            $("#mm").attr("value",files[0].name);
            $("#gallery1").attr("value",files[1].name);
            $("#gallery2").attr("value",files[2].name);
        });
	});
	
	
	/* 포스터 출력 */
	function readURL(input) {
	  console.log(input.files);
	  if (input.files && input.files[0]) {
	    var reader = new FileReader();
	    reader.onload = function (e) {
	      $("#img-preview").attr("src", e.target.result);
	    };

	    reader.readAsDataURL(input.files[0]);
	  } else {
	    $("#img-preview").attr("src", noimage);
	  }
	}
	 
	/* 영화감독 이미지출력 */

	function readURL1(input) {
	  console.log(input.files);
	  if (input.files && input.files[0]) {
	    var reader = new FileReader();
	    reader.onload = function (e) {
	      $("#img-preview1").attr("src", e.target.result);
	    };

	    reader.readAsDataURL(input.files[0]);
	  } else {
	    $("#img-preview1").attr("src", noimage);
	  }
	}
	
	/* 갤러리 출력 */
	jQuery(document).ready(function () {
		  ImgUpload();
		});

		function ImgUpload() {
		  var imgWrap = "";
		  var imgArray = [];

		  $('.upload__inputfile').each(function () {
		    $(this).on('change', function (e) {
		      imgWrap = $(this).closest('.upload__box').find('.upload__img-wrap');
		      var maxLength = $(this).attr('data-max_length');

		      var files = e.target.files;
		      var filesArr = Array.prototype.slice.call(files);
		      var iterator = 0;
		      filesArr.forEach(function (f, index) {

		        if (!f.type.match('image.*')) {
		          return;
		        }

		        if (imgArray.length > maxLength) {
		          return false
		        } else {
		          var len = 0;
		          for (var i = 0; i < imgArray.length; i++) {
		            if (imgArray[i] !== undefined) {
		              len++;
		            }
		          }
		          if (len > maxLength) {
		            return false;
		          } else {
		            imgArray.push(f);

		            var reader = new FileReader();
		            reader.onload = function (e) {
		              var html = "<div class='upload__img-box'><div style='background-image: url(" + e.target.result + ")' data-number='" + $(".upload__img-close").length + "' data-file='" + f.name + "' class='img-bg'><div class='upload__img-close'></div></div></div>";
		              imgWrap.append(html);
		              iterator++;
		            }
		            reader.readAsDataURL(f);
		          }
		        }
		      });
		    });
		  });

		  $('body').on('click', ".upload__img-close", function (e) {
		    var file = $(this).parent().data("file");
		    for (var i = 0; i < imgArray.length; i++) {
		      if (imgArray[i].name === file) {
		        imgArray.splice(i, 1);
		        break;
		      }
		    }
		    $(this).parent().parent().remove();
		  });

		  document.getElementById('#files').readOnly = true;
		}
	

    </script>
       <div>
       <div  class="can-1">
          <fieldset>
           <legend><span class="number">1</span>영화사진</legend>
             <label for="image"></label>
            <img id="img-preview" src="https://ami-sni.com/wp-content/themes/consultix/images/no-image-found-360x250.png" width="250px" />
           
						<div>
						  <input type="file" accept="image/*" onchange="readURL(this)" class="image_gallery" name="movie_poster" />
						</div>

    			<div id="image_container"></div>
          </fieldset>
        </div>
        
        
                <div class="can-1">
        <fieldset >
          <legend><span class="number" >2</span>영화제목</legend>
          <label for="name"></label>
          <input type="text" id="name" name="movie_title"  >
        </fieldset>
        
	        <div class="can-1-1">
	          <fieldset >
	          <legend><span class="number" >3</span>영화상영시간</legend>
	          <label for="name"></label>
	          <input type="text" id="name" name="movie_time" >	
        	</fieldset>
        	</div>
        </div>
        
        
        
        <div class="can-2">
        <fieldset>
          <legend><span class="number">4</span>영화 내용</legend>
          
          <textarea id="bio" name="movie_cont" rows="8" cols="25" ></textarea>
        </fieldset>
     	</div>
          
	
	<div class="can-1">
        <fieldset >
          <legend><span class="number" >5</span>영화발매일</legend>
          <label for="name"></label>
          <input type="text" id="name" name="movie_date" width="100px" >
        </fieldset>
        </div>
        
	        <div class="can-1-1">
	          <fieldset  class="rightfield">
	          <legend><span class="number" >6</span>영화장르</legend>
	          <label for="name"></label>
	          <input type="text" id="name" name="movie_genre" >	
        	</fieldset>
        	</div>
        	
         	
	<div class="can-1">
        <fieldset class="leftfield">
          <legend><span class="number" >7</span>상영연령</legend>
          <label for="name"></label>
          <input type="text" id="name" name="movie_age"  >
        </fieldset>
         	</div>
         	
               <div>
         <fieldset class="rightfield">
          <legend><span class="number" >8</span>국가</legend>
          <label for="name"></label>
          <input type="text" id="name" name="movie_country" >
        </fieldset>
        </div>	
        	<div  class="can-1">
          <fieldset>
           <legend><span class="number">9</span>감독사진</legend>
             <label for="image"></label>
             
           <img id="img-preview1" class="img_no" src="https://ami-sni.com/wp-content/themes/consultix/images/no-image-found-360x250.png" width="250px"
            />
						<div>
						  <input type="file" accept="image/*" onchange="readURL1(this)" width="280" name="movie_dpic" >
						</div>

    			<div id="image_container"></div>
          </fieldset>
        </div>

        
	        <div class="can-1-1">
	          <fieldset class="rightfield">
	          <legend><span class="number" >10</span>영화감독</legend>
	          <label for="name"></label>
	          <input type="text" id="name" name="movie_director" width="200px" height="150px">	
        	</fieldset>
        	</div>
       </div>

       <div>
             <div class="can-1-1">
	          <fieldset >
	          <legend><span class="number" >11</span>영화영상</legend>
	          <label for="name"></label>
	          <input type="text" id="name" name="movie_video" width="200px" height="150px">	
        	</fieldset>
        	</div>
       </div>

      <div class="button-wrapper">
  <span class="label">
    Upload File
  </span>
  
    <input type="file" name="upload" id="upload" class="upload-box" placeholder="Upload File">
  
</div>

       <div  class="center">       
	          <fieldset>
	          <legend><span class="number" >12</span>갤러리</legend>
	        
 			   <div style='padding:14px'>
        <label for="files"></label>
        <input id="files" type="file" name="gallery" multiple/>
 <!--       <input type="button"  id="id" value="저장">    -->   
  	  </div>
				  <div style='padding:14px; margin:auto';>
				  <div id="sortableImgThumbnailPreview">
				 
					        
				    </div>
				  </div>
				  
        	</fieldset>
        	</div>


        <button type="submit" id="id" >Add List</button>

      </form>
      <jsp:include page="../include/admin_bottom.jsp" />
    </body>
    <script type="text/javascript">
	
	$(function() {
        $("#sortableImgThumbnailPreview").sortable({
         connectWith: ".RearangeBox",
        
            
          start: function( event, ui ) { 
               $(ui.item).addClass("dragElemThumbnail");
               ui.placeholder.height(ui.item.height());
       
           },
            stop:function( event, ui ) { 
               $(ui.item).removeClass("dragElemThumbnail");
           }
        });
        $("#sortableImgThumbnailPreview").disableSelection();
        
        
        
        
 
    });




document.getElementById('files').addEventListener('change', handleFileSelect, false);

function handleFileSelect(evt) {

var files = evt.target.files; 
var output = document.getElementById("sortableImgThumbnailPreview");

// Loop through the FileList and render image files as thumbnails.
for (var i = 0, f; f = files[i]; i++) {

  // Only process image files.
  if (!f.type.match('image.*')) {
    continue;
  }

  var reader = new FileReader();

  // Closure to capture the file information.
  reader.onload = (function(theFile) {
    return function(e) {
      // Render thumbnail.
       var imgThumbnailElem = "<div class='RearangeBox imgThumbContainer'><i class='material-icons imgRemoveBtn' onclick='removeThumbnailIMG(this)'>cancel</i><div class='IMGthumbnail' ><img  src='" + e.target.result + "'" + "title='"+ theFile.name + "'/></div><div class='imgName'>"+ theFile.name +"</div></div>";
                
                output.innerHTML = output.innerHTML + imgThumbnailElem; 
      
    };
  })(f);

  // Read in the image file as a data URL.
  reader.readAsDataURL(f);
}
}

function removeThumbnailIMG(elm){
elm.parentNode.outerHTML='';
}


    
    </script>
</html>