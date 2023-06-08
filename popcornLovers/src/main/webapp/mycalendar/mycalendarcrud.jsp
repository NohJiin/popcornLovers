<%@page import="java.util.Calendar"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	Calendar cal = Calendar.getInstance();
int y = cal.get(Calendar.YEAR);
int m = cal.get(Calendar.MONTH); //표기할 때 +1

String yy = request.getParameter("yy");
String mm = request.getParameter("mm");

int y1 = y - 20;
int y2 = y + 20;

if (yy != null && mm != null && !yy.equals("") && !mm.equals("")) {
	y = Integer.parseInt(yy);
	m = Integer.parseInt(mm) - 1;
}

if (yy == null || yy.equals("")) {
	yy = Integer.toString(y);
}

if (mm == null || mm.equals("")) {
	mm = Integer.toString(m + 1);
}

int b_y = y;
int b_m = m;
int n_y = y;
int n_m = m + 2;

if (b_m == 0) {
	b_y = b_y - 1;
	b_m = 12;
} else if (n_m == 13) {
	n_y = y + 1;
	n_m = 1;
}

cal.set(y, m, 1);

int dayOfweek = cal.get(Calendar.DAY_OF_WEEK);
//오늘의 요일 (1~7 숫자로 표기)
//셋팅 날짜를 1일로 설정, 첫째날의 요일 가져오기
int lastday = cal.getActualMaximum(Calendar.DATE);
//그 달의 마지막날짜 가져오기
%>



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>달력</title>

<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/jquery-3.6.4.js"></script>
<script type="text/javascript">
	$(function() {
		$("#listbutton").click(function() {
			$.ajax({
				url : "../mycalendarview/movielist.jsp",
				success : function(x) {
					alert("list 불러오기 성공")
				},
				error : function() {
					
				}
			});
		});
	});
</script>
</head>


<style>

.mymoviecalendar table {
	padding-bottom: 100px;
	;
}

.mymoviecalendar tr, .mymoviecalendar td, .mymoviecalendar th {
	border: none;
	width: 120px;
	height: 100px;
	text-align: center;
	font-size: 30px;
	background-color: white;
}

.mymoviecalendar button {
	width: 80px;
	height: 80px;
	font-size: 40px;
	border: none;
	background-color: #fff9ab;
	border-radius: 40px;
}

.mymoviecalendar caption {
	margin-bottom: 30px;
	font-size: 50px;
	color: #000000;
	padding-top: 30px;
}

input, button {
	margin-bottom: 10px;
	margin-left: 3px;
	margin-right: 3px;
	font-size: 20px;
	color: #000000;
	width: 70px;
}

select {
	margin-bottom: 10px;
	font-size: 20px;
	color: #000000;
	width: 100px;
}

.mymoviecalendar {
	width: 60%;
	height: 100%;
	float: left;
}

.calendarsetting {
	width: 36%;
	height: 100%;
	float: left;
	padding-left: 4%;
	padding-top: 4%;
	padding-bottom: 3%;
}

.calendarinsert {
	width: 36%;
	height: 100%;
	float: left;
	padding-left: 4%;
	font-size: 20pt;
	color: black;
}

.insert1 {
	width: 80px;
	height: 20px;
	text-align: right;
}

.insert2 {
	width: 300px;
	text-align: center;
}

.all {
	font-size: 0px;
}



.calendarinsert td, .calendarinsert tr {
	border: none;
	border-collapse: collapse;
	padding: 5px;
	font-size: 20px;
	height: 40px;
	background-color: #fdffbf;
}

.insertcaption {
	font-size: 30px;
}

.calendarinsert button {
	width: 420px;
	height: 60px;
}

.insertinput {
	width: 200px;
	text-align: center;
}

.movielist button {
	width: 400px;
	height: 100px;
}

.movielistjoin tr, .movielistjoin td, .movielistjoin table {
	border: 1px solid black;
	border-style: dotted;
	border-collapse: collapse;
	padding: 5px;
	font-size: 20px;
	height: 40px;
	background-color: #fdffbf;
}

.movielistjoin button {
	width: 420px;
	height: 60px;
}

.movielistjoin {
	width: 36%;
	height: 100%;
	float: left;
	padding-left: 4%;
	padding-top: 4%;
	padding-bottom: 3%;
}
</style>

<body>

	<%@ include file="../WEB-INF/views/header.jsp"%>

	<div class="all">
		<div class="mymoviecalendar">
			<table>
				<caption><%=y%>년
					<%=m + 1%>월
				</caption>
				<tr>
					<th>일</th>
					<th>월</th>
					<th>화</th>
					<th>수</th>
					<th>목</th>
					<th>금</th>
					<th>토</th>
				</tr>
				<tr>

					<%
						int count = 0;

					for (int s = 1; s < dayOfweek; s++) {
						out.print("<td></td>");
						count++;
					}

					for (int d = 1; d <= lastday; d++) {
						count++;
						String color = "#141313";
						if (count % 7 == 0) {
							color = "#0004ff";
						} else if (count % 7 == 1) {
							color = "#ff1500";
						}
					%>
					<td style="color:<%=color%>;">
						<button type="submit" name="day" value="<%=d%>" id="datebutton"
							class="datebutton" style="color:<%=color%>;">
							<%=d%>
						</button>
					</td>
					<%
						if (count % 7 == 0) {
						out.print("</tr><tr>");
						count = 0;
					}
					}

					while (count < 7) {
					out.print("<td></td>");
					count++;
					}
					%>
				</tr>
			</table>
		</div>
		<div class="calendarsetting">
			<h1 style="font-size: 24px;">달력 설정</h1>
			<form name="frm" method="get" action="mycalendarcrud.jsp">

				<button type="button"
					onclick="location='mycalendarcrud.jsp?yy=<%=b_y%>&mm=<%=b_m%>'">이전</button>

				<select name="yy">
					<%
						for (int yyy = y1; yyy <= y2; yyy++) {
						String check1 = "";
						if (yyy == Integer.parseInt(yy)) {
							check1 = "selected";
						}
					%>
					<option value="<%=yyy%>" <%=check1%>><%=yyy%>년
					</option>
					<%
						}
					%>
				</select> <select name="mm">
					<%
						for (int mmm = 1; mmm <= 12; mmm++) {
						String check2 = "";
						if (mmm == Integer.parseInt(mm)) {
							check2 = "selected";
						}
					%>
					<option value="<%=mmm%>" <%=check2%>><%=mmm%>월
					</option>
					<%
						}
					%>
				</select> <input type="submit" value="입력">

				<button type="button"
					onclick="location='mycalendarcrud.jsp?yy=<%=n_y%>&mm=<%=n_m%>'">다음</button>

			</form>
		</div>
		<div class="calendarinsert">

			<form action="mycalendarcrud" method="post">
				<table class="inserttable">
					<caption class="insertcaption">일정 추가 하기</caption>
					<tr>
						<td class="insert1">연도 :</td>
						<td class="insert2"><input type="text" id="year" name="year"
							value="<%=y%>" class="insertinput" placeholder="년도"></td>
					</tr>
					<tr>
						<td class="insert1">월 :</td>
						<td class="insert2"><input type="text" id="month"
							name="month" value="<%=m + 1%>" class="insertinput"
							placeholder="월"></td>
					</tr>
					<tr>
						<td class="insert1">일 :</td>
						<td class="insert2"><input type="text" id="day" name="day"
							value="" class="insertinput" placeholder="일"></td>
					</tr>
					<tr>
						<td class="insert1">영화 :</td>
						<td class="insert2"><input type="text" id="movieId"
							name="movieId" value="" class="insertinput" placeholder="영화 ID"></td>
					</tr>
					<tr>
						<td colspan="2" class="insert2">
						<button type="submit" id="insertbutton">등록하기</button></td>
					</tr>
					<tr>
						<td colspan="2" class="insert2">
						<button type="button" id="listbutton" onclick="location='movielist.jsp'">영화ID 찾기</button></td>
					</tr>
				</table>
			</form>
		</div>
	</div>
</body>
</html>