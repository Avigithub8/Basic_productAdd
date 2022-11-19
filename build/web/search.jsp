
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Search Product</title>
    </head>
    <body>
        <%
             try{
                        String p=request.getParameter("name");
			out.println("<html><body>");
			out.println("<h1>search product</h1>");
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection(
                       "jdbc:mysql://localhost:3306/product_info","root", "incapp");
			Statement st=con.createStatement();
			java.sql.ResultSet rs=st.executeQuery("select * from product_info where name LIKE '%"+p+"%'");
	%>
        <html><body>
         <h1> Product Details</h1> <hr>
         <%
             int x=0;
             while(rs.next()){
                 x=1;
         %>
             Product ID: <%= rs.getInt("pid")%><br>
             Name  : <%= rs.getString("name")%><br>
             Price: <%= rs.getInt("price")%><br>
             Info : <%= rs.getString("info")%><br> <hr>
             
           <%
              x++;
           }
           if(x==0){
           %>
           <h1> No Record Found</h1>
           <%
             }
            } catch(java.sql.SQLIntegrityConstraintViolationException ex){  }
                   
           %>
    </body>
</html>
