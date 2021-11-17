<%-- 
    Document   : exemplo02
    Created on : 17 de nov de 2021, 15:26:41
    Author     : Alfamidia
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Exemplo 02 Gravar o Curso</h1>
        
        <form action="exemplo02.jsp" method="post">
            Nome do curso : <br>
            <input type="text" name="nom"/>
            <br/><br/>
             Descrição: <br>
             <textarea name="desc"> </textarea>
             <br/><br/>
            Valor do curso : <br>
            <input type="text" name="val"/>
            <br/><br/>
            <input type="submit" name="sub" value="Cadastrar"/>
        </form>
         <%@page  import="java.sql.*" %>
        <%
            if(request.getParameter("sub")!= null){
            
                Class.forName("com.mysql.jdbc.Driver");
                
                String url = "jdbc:mysql://localhost/alfajava";
                String user = "root";
                String pass = "";
                Connection con = DriverManager.getConnection(url,user,pass);
                
                String nome = request.getParameter("nom");
                String desc = request.getParameter("desc");
                String val = request.getParameter("val");
                
                String sql ="insert into cursos (nome,descricao,valor)"
                           + "values(?,?,?)";
               
                PreparedStatement stmt = con.prepareStatement(sql);
                
                stmt.setString(1, nome);
                stmt.setString(2, desc);
                stmt.setFloat(3, Float.parseFloat(val));
                
                int res = stmt.executeUpdate();
                if(res >0){
                    
                    out.print("Cadastrado com sucesso");
                }else{
                        out.print("Cadastrado deu zebra");
                }
                
                stmt.close();
                con.close();
            }
              
            

        %>
    </body>
</html>
