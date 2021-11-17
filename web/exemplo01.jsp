<%-- 
    Document   : exemplo01
    Created on : 17 de nov de 2021, 14:59:21
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
        <h1>Exemplo para conexão com banco de dados</h1>
        <h5>1) Identificar a fonte e efetuar a concexão com a base de dades <br>
            2) Criar o SQL e o objeto que represeta esse comando <br/>
            3) Objer o resultado da execução do SQL e manipular <br/><!-- comment -->
            4) Fechar conexão.</h5>
        
        <!-- REALIZAR OS IMPORTS NECESSÁRIOS -->
        <%@page import="java.sql.*" %>
        
        
       <%
          /*IDENDIFCAR QUAL E A BASE DE DADOS E REALIAR A CONEXAO EFETIVAMENTE*/
           Class.forName("com.mysql.jdbc.Driver");
           
           String host = "jdbc:mysql://localhost/alfajava";
           String user = "root";
           String pass = "";
           Connection con;
           con = DriverManager.getConnection(host,user,pass);
           
           /*REALIZADO A IDENTIFICAÇAO E A CONEXÃO*/
           
           
           /*AGORA CRIA OS OBJETOS E O COMANDO SQL PARA MANIPULAR OS RESULTADOS*/
            Statement stmt = con.createStatement();
            
            String sql = "select * from cursos";
            
            ResultSet rset = stmt.executeQuery(sql); // aqui eu pego os resultados
            
            // MANIPULO OS RESULTADOS
            
            while(rset.next()){
                out.print("<hr>");
                out.print("<strong>Nome Curso: </strong>"+ rset.getString("nome") + " - "+"<br/>");
                out.print("<strong>Descrição Curso: </strong>"+rset.getString("descricao") + "<br/><br/>");
                
            }
            
            /*FECHA NA SEQUENCIA*/
            rset.close();
            stmt.close();
            con.close();
            
       %>
        
        
    </body>
</html>
