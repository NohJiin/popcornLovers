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
</head>


<style>
	body {
		font-size: 16pt;
		color: #1e1e1f;
	}

	table {
		border-collapse: collapse;
	}

	th, td {
		border: 1px solid #141313;
		width: 160px;
		height: 120px;
		text-align: center;
	}

	caption, input {
		margin-bottom: 10px;
		font-size: 30px;
		color: #0015ff;
	}
</style>

<body>

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
			<td style="color:<%=color%>;"><%=d%></td>
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

	<form name="frm" method="get" action="mycalendar.jsp">

		<button type="button"
			onclick="location='mycalendar.jsp?yy=<%=b_y%>&mm=<%=b_m%>'">이전</button>

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
			onclick="location='mycalendar.jsp?yy=<%=n_y%>&mm=<%=n_m%>'">다음</button>

	</form>




</body>
</html>