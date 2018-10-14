
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js">
	<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js">
</script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<script>
	$(document)
			.ready(
					function() {

						setTableData();

						$("#register")
								.click(
										function() {
											$
													.ajax({

														type : 'POST',
														url : 'studentInsert',
														data : $("#studentForm")
																.serialize(),
														dataType : 'JSON',
														success : function(
																response) {
															console
																	.log(response);
															var str1 = "";
															str1 = '<table border="1"><tr><th>ID</th><th>NAME</th><th>Address</th><th>Action</th><th>Action</th></tr>';

															$
																	.each(
																			response,
																			function(
																					i,
																					response) {
																				var id = response.id;
																				str1 += '<tr><td>'
																						+ id
																						+ '</td><td>'
																						+ response.name
																						+ '</td><td>'
																						+ response.address
																						+ '</td> <td>'
																						+ '<a href="#" '
																						+ 'onclick=javaScript:editStudent('
																						+ response.id
																						+ ')>Edit</a>'
																						+ '</td><td>'
																						+ '<a href="#" onclick=javaScript:deleteStudent('
																						+ response.id
																						+ ')>Delete</a>'
																						+ '</td></tr>';
																			});
															str1 += '</table>';
															$("#myDiv").html(
																	str1);
														},
														error : function(e) {
															alert("something went wrong.."
																	+ e);
														}
													});
										});
					});

	function editStudent(id) {
		console.log(id);
		$.ajax({
			url : "editStudent",
			type : "GET",
			data : {
				id : id
			},
			dataType : "json",
			success : function(response) {
				var register = response;
				console.log(register)
				console.log(response.name + response.address)
				$("#id").val(response.id);
				$("#name").val(response.name);
				$("#address").val(response.address);

				$("#studentForm").html();
			}
		});
	}

	function deleteStudent(id) {
		console.log(id);
		alert("Are you sure you want ot delete record?");
		$.ajax({
			url : "deleteStudent",
			type : "GET",
			data : {
				id : id
			},
			dataType : "json",
			success : function(response) {

				alert(response.message)
				setTableData()

			},

		});
	}

	function setTableData() {

		$
				.ajax({

					type : 'POST',
					url : 'viewlist',
					data : $("#studentForm").serialize(),
					dataType : 'JSON',
					success : function(response) {
						console.log(response);
						var str1 = "";
						str1 = '<table border="1"><tr><th>ID</th><th>NAME</th><th>Address</th><th>Action</th><th>Action</th></tr>';

						$
								.each(
										response,
										function(i, response) {
											var id = response.id;
											str1 += '<tr><td>'
													+ id
													+ '</td><td>'
													+ response.name
													+ '</td><td>'
													+ response.address
													+ '</td> <td>'
													+ '<a href="#" '
													+ 'onclick=javaScript:editStudent('
													+ response.id
													+ ')>Edit</a>'
													+ '</td><td>'
													+ '<a href="#" onclick=javaScript:deleteStudent('
													+ response.id
													+ ')>Delete</a>'
													+ '</td></tr>';
										});
						str1 += '</table>';
						$("#myDiv").html(str1);
					},
					error : function(e) {
						alert("something went wrong.." + e);
					}
				});
	}
</script>


<form:form class="form-horizontal" modelAttribute="studentForm"
	id="studentForm" method="POST">
	<fieldset>
		<form:hidden path="id" />
		<!-- Form Name -->
		<legend>Student Registeration-Spring-Ajax</legend>
		<!-- Text input-->
		<div class="form-group">
			<label class="col-md-4 control-label" for="name">Enter Name</label>
			<div class="col-md-4">
				<form:input path="name" name="name" type="text"
					placeholder="Enter Name" class="form-control input-md" />
				<span class="help-block"> </span>
			</div>
		</div>

		<!-- Text input-->
		<div class="form-group">
			<label class="col-md-4 control-label" for="address">Enter
				Address</label>
			<div class="col-md-4">
				<form:input path="address" name="address" type="text"
					placeholder="Enter Address" class="form-control input-md" />
				<span class="help-block"> </span>
			</div>
		</div>

		<!-- Button -->
		<div class="form-group">
			<label class="col-md-4 control-label" for="register"> </label>
			<div class="col-md-4">
				<button id="register" type="button" name="register"
					class="btn btn-primary">Submit</button>
			</div>
		</div>
	</fieldset>
</form:form>

<div id=myDiv align="justify"></div>




