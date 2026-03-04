<form action="../FeedbackServlet" method="post">
<%
if (session.getAttribute("user") == null) {
    response.sendRedirect("../login.jsp");
}
%>

<label>Faculty</label>
<select name="faculty">
  <option>Dr. Sharma</option>
  <option>Prof. Khan</option>
</select>

<div class="stars">
  <input type="radio" name="rating" value="5" id="5"><label for="5">★</label>
  <input type="radio" name="rating" value="4" id="4"><label for="4">★</label>
  <input type="radio" name="rating" value="3" id="3"><label for="3">★</label>
  <input type="radio" name="rating" value="2" id="2"><label for="2">★</label>
  <input type="radio" name="rating" value="1" id="1"><label for="1">★</label>
</div>

<textarea name="comments" placeholder="Your feedback"></textarea>
<button type="submit">Submit</button>
</form>
