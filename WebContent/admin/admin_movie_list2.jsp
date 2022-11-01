<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Start Up</title>
		<script src="https:////cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script> 
    <style type="text/css">

body {
  font-family: 'Roboto', sans-serif;
}
body, .button:after {
  background: #2c3e50;
}
.ctn {
  display: block;
  margin: auto;
  text-align: center;
}
footer {
  position: fixed;
  bottom: 5px;
  right: 5px;
  color: #FFF;
}
footer a, footer a:after {
  font-size: 1em !important;
}
/*END BODY*/

/*GRADIENTS*/
  /*GREEN*/
  .b-green, .b-green:before {
    background: rgba(73,155,234,1);
    background: -moz-linear-gradient(45deg, rgba(73,155,234,1) 0%, rgba(26,188,156,1) 100%);
    background: -webkit-gradient(left bottom, right top, color-stop(0%, rgba(73,155,234,1)), color-stop(100%, rgba(26,188,156,1)));
    background: -webkit-linear-gradient(45deg, rgba(73,155,234,1) 0%, rgba(26,188,156,1) 100%);
    background: -o-linear-gradient(45deg, rgba(73,155,234,1) 0%, rgba(26,188,156,1) 100%);
    background: -ms-linear-gradient(45deg, rgba(73,155,234,1) 0%, rgba(26,188,156,1) 100%);
    background: linear-gradient(45deg, rgba(73,155,234,1) 0%, rgba(26,188,156,1) 100%);
    filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#499bea', endColorstr='#1abc9c', GradientType=1 );
  }
  /*PINK*/
  .b-pink, .b-pink:before {
    background: rgba(231,72,234,1);
    background: -moz-linear-gradient(45deg, rgba(231,72,234,1) 0%, rgba(75,26,188,1) 100%);
    background: -webkit-gradient(left bottom, right top, color-stop(0%, rgba(231,72,234,1)), color-stop(100%, rgba(75,26,188,1)));
    background: -webkit-linear-gradient(45deg, rgba(231,72,234,1) 0%, rgba(75,26,188,1) 100%);
    background: -o-linear-gradient(45deg, rgba(231,72,234,1) 0%, rgba(75,26,188,1) 100%);
    background: -ms-linear-gradient(45deg, rgba(231,72,234,1) 0%, rgba(75,26,188,1) 100%);
    background: linear-gradient(45deg, rgba(231,72,234,1) 0%, rgba(75,26,188,1) 100%);
    filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#e748ea', endColorstr='#4b1abc', GradientType=1 );
  }
  /*RED*/
  .b-red, .b-red:before {
    background: rgba(234,110,72,1);
    background: -moz-linear-gradient(45deg, rgba(234,110,72,1) 0%, rgba(188,26,99,1) 100%);
    background: -webkit-gradient(left bottom, right top, color-stop(0%, rgba(234,110,72,1)), color-stop(100%, rgba(188,26,99,1)));
    background: -webkit-linear-gradient(45deg, rgba(234,110,72,1) 0%, rgba(188,26,99,1) 100%);
    background: -o-linear-gradient(45deg, rgba(234,110,72,1) 0%, rgba(188,26,99,1) 100%);
    background: -ms-linear-gradient(45deg, rgba(234,110,72,1) 0%, rgba(188,26,99,1) 100%);
    background: linear-gradient(45deg, rgba(234,110,72,1) 0%, rgba(188,26,99,1) 100%);
    filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#ea6e48', endColorstr='#bc1a63', GradientType=1 );
  }
  /*ORANGE*/
  .b-orange, .b-orange:before {
    background: rgba(255,193,7,1);
    background: -moz-linear-gradient(45deg, rgba(255,193,7,1) 0%, rgba(255,87,34,1) 100%);
    background: -webkit-gradient(left bottom, right top, color-stop(0%, rgba(255,193,7,1)), color-stop(100%, rgba(255,87,34,1)));
    background: -webkit-linear-gradient(45deg, rgba(255,193,7,1) 0%, rgba(255,87,34,1) 100%);
    background: -o-linear-gradient(45deg, rgba(255,193,7,1) 0%, rgba(255,87,34,1) 100%);
    background: -ms-linear-gradient(45deg, rgba(255,193,7,1) 0%, rgba(255,87,34,1) 100%);
    background: linear-gradient(45deg, rgba(255,193,7,1) 0%, rgba(255,87,34,1) 100%);
    filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#ffc107', endColorstr='#ff5722', GradientType=1 );
  }
  /*BLUE*/
  .b-blue, .b-blue:before {
    background: rgba(5,118,255,1);
    background: -moz-linear-gradient(45deg, rgba(5,118,255,1) 0%, rgba(36,248,255,1) 100%);
    background: -webkit-gradient(left bottom, right top, color-stop(0%, rgba(5,118,255,1)), color-stop(100%, rgba(36,248,255,1)));
    background: -webkit-linear-gradient(45deg, rgba(5,118,255,1) 0%, rgba(36,248,255,1) 100%);
    background: -o-linear-gradient(45deg, rgba(5,118,255,1) 0%, rgba(36,248,255,1) 100%);
    background: -ms-linear-gradient(45deg, rgba(5,118,255,1) 0%, rgba(36,248,255,1) 100%);
    background: linear-gradient(45deg, rgba(5,118,255,1) 0%, rgba(36,248,255,1) 100%);
    filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#0576ff', endColorstr='#24f8ff', GradientType=1 );
  }
/*END GRADIENTS*/
/*BASE BUTTON*/
.button {
  display: inline-block;
  position: relative;
  border-radius: 3px;
  text-decoration: none;
  padding: .5em;
  margin: .5em;
  font-size: 2em;
  font-weight: bold;
  transition: all .5s;
  -webkit-background-clip: text;
  -webkit-text-fill-color: transparent;
}
.button:hover {
  text-shadow: 0px 0px 0px rgba(255, 255, 255, .75);
}
.button:hover:after {
  left: 100%;
  top: 100%;
  bottom: 100%;
  right: 100%;
}
.button:before {
  content: '';
  display: block;
  position: absolute;
  left: 0;
  top: 0;
  bottom: 0;
  right: 0;
  z-index: -1;
  border-radius: 5px;
  transition: all .5s;
}
.button:after {
  content: '';
  display: block;
  position: absolute;
  left: 2px;
  top: 2px;
  bottom: 2px;
  right: 2px;
  z-index: -1;
  border-radius: 5px;
  transition: all .5s;
}
.button2 {
  display: inline-block;
  font-size: 2em;
  margin: .5em;
  padding: .5em;
  border-radius: 5px;
  transition: all .5s;
  filter: hue-rotate(0deg);
  color: #FFF;
  text-decoration: none;
}
/*END BASE BUTTON*/
/*ROTATE*/
.rot-360-noscoop:hover {
  filter: hue-rotate(360deg);
  transform: rotate(360deg);
}
.rot-135:hover {
  filter: hue-rotate(135deg);
}
.rot-90:hover {
  filter: hue-rotate(90deg);
}
/*END ROTATE*/
    
    </style>
  
</head>

<body>

<div class="ctn">
<a href="http://themonkey.co" class="button b-green">Green Button</a>
<a href="http://themonkey.co" class="button b-pink">Pink Button</a>
<a href="http://themonkey.co" class="button b-red">Red Button</a>
<a href="http://themonkey.co" class="button b-orange">Orange Button</a>
<a href="http://themonkey.co" class="button b-blue">Blue Button</a>
<br/>
<a href="http://themonkey.co" class="button2 b-green rot-135">Green button</a>
<a href="http://themonkey.co" class="button2 b-pink rot-135">Pink button</a>
<a href="http://themonkey.co" class="button2 b-red rot-135">Red button</a>
<a href="http://themonkey.co" class="button2 b-orange rot-135">Orange button</a>
<a href="http://themonkey.co" class="button2 b-blue rot-135">Blue button</a>
</div>
<footer><a href="http://themonkey.co" class="button b-red" target="_blank">By Monkey Company</a></footer>



<script src="https://cdnjs.cloudflare.com/ajax/libs/list.js/1.1.1/list.min.js" ></script> 


</body>
</html>

