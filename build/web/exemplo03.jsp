<%-- 
    Document   : exemplo03
    Created on : 17 de nov de 2021, 15:49:52
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
        <h1>LISTANDO CONTEUDO COM O JSTL - IMPORTANTE É MENOS COMUM </h1>
        
        <%-- primeiramente eu importo as bibliotecas --%>
        <%@taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <%@taglib  uri ="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
        <c:catch var="ex" >
            
                  <%-- SET O DRIVER O BANCO USUARIO URL E CRIO A CONEXAO  --%>
            <sql:setDataSource 
                driver="com.mysql.jdbc.Driver"
                user = "root"
                password=""
                url = "jdbc:mysql://localhost/alfajava"
                var="con"/>
            
              <%-- CRIA - SE A INSTRUÇAO SQL PARA A CONSULTA --%>
              
              <sql:query var="res" dataSource="${con}">
                  Select * from cursos
              </sql:query>
                  
               <%-- EU PERCORRO E MONIPULO OS DADOS OBTIDOS --%> 
               <c:forEach items="${res.rows}" var="linha">
                   <strong>${linha.nome}</strong> --  ${linha.valor} <br>
               </c:forEach>
        </c:catch>
               <c:if test="${ex != null}">
                   Houve um problema <br/><!-- comment -->
                   ${ex}
               </c:if>
    </body>
</html>
