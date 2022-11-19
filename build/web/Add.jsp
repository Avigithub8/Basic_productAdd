<html>
    <%@page import="java.sql.*"%>
    <%@page contentType="text/html" pageEncoding="UTF-8"%>
    <head>
        <title>Product APP</title>
       </head>
    <body>
        <%
            try{
                        String n=request.getParameter("name");
			int p=Integer.parseInt(request.getParameter("price"));
			String i=request.getParameter("info");
			out.println("<html><body>");
			out.println("<h1>product add</h1>");
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/product_info","root", "incapp");
			Statement st=con.createStatement();
			st.executeUpdate("insert into product_info (name,price,info)values('"+n+"',"+p+",'"+i+"')");
                 %>
                 <h>  Product Added Successfully !</h>
                 <%
                     }catch(java.sql.SQLIntegrityConstraintViolationException e){
                     %>
                 <h>  Product Already Exist !</h>
                 <%
                   }
                 %>
    </body>
</html>
