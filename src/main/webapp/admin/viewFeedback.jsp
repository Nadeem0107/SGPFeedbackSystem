<%@ page import="java.util.*, model.Feedback" %>
<%
if (session.getAttribute("user") == null) {
    response.sendRedirect("../login.jsp");
}
%>

<table border="1">
<tr>
  <th>Faculty</th>
  <th>Rating</th>
  <th>Comments</th>
</tr>

<%
List<Feedback> list = (List<Feedback>) request.getAttribute("feedbackList");
for(Feedback f : list){
%>
<tr>
  <td><%= f.getFaculty() %></td>
  <td>
    <% for(int i=1;i<=5;i++){
         out.print(i <= f.getRating() ? "★" : "☆");
       }
    %>
  </td>
  <td><%= f.getComments() %></td>
</tr>
<% } %>

</table>
