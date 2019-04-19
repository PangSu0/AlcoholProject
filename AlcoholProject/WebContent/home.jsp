<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<html lang="en">
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
	</head>
	<body>

		<div class="container-title">
			<%@include file="title.jsp"%>
		</div>
		<div class="button">
			<%@include file="button.jsp"%>
		</div>
		<div class="main">
			<div class="row">
				<div class="col-sm-1"></div>
				<div class="col-sm-6"><img src="img/model1.jpg" class="rounded" alt="Cinque Terre" width="600" height="297"></div>
				<div class="col-sm-4"><img src="img/model0.jpg" class="rounded" alt="Cinque Terre" width="275" height="297"></div>
				<div class="col-sm-1"></div>
			</div>
		</div>
	</body>
</html>
