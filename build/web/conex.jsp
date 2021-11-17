<%@taglib  uri ="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%-- SET O DRIVER O BANCO USUARIO URL E CRIO A CONEXAO  --%>
<sql:setDataSource 
    driver="com.mysql.jdbc.Driver"
    user = "root"
    password=""
    url = "jdbc:mysql://localhost/alfajava"
    var="con"/>
