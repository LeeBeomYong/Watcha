<html lang="en">

<head>    
  <link href="https://fonts.googleapis.com/icon?family=Material+Icons"
      rel="stylesheet">
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script> 
    
    <style type="text/css">
    .ui-sortable-placeholder { 
    	border: 1px dashed black!important; 
        visibility: visible !important;
        background: #eeeeee78 !important;
       }
    .ui-sortable-placeholder * { visibility: hidden; }
        .RearangeBox.dragElemThumbnail{opacity:0.6;}
        .RearangeBox {
            width: 180px;
            height:240px;
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
  padding: 2px 6px;
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
   </style>
</head>

<body>
    <div style='padding:14px'>
        <label for="files">Select multiple files: </label>
        <input id="files" type="file" multiple/>        
    </div>
  <div style='padding:14px; margin:auto';>
  <div id="sortableImgThumbnailPreview">
        
    </div>
  </div>
  

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