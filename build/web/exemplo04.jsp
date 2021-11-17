<%-- 
    Document   : exemplo04
    Created on : 17 de nov de 2021, 16:13:08
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
        <h1>Gravar curso com JSTL</h1>

        <form action="exemplo04.jsp" method="post">
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

        <%-- primeiramente eu importo as bibliotecas --%>
        <%@taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <%@taglib  uri ="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
        <c:if test="${param.sub != null}">


            <c:catch var="ex" >

                <%-- SET O DRIVER O BANCO USUARIO URL E CRIO A CONEXAO  --%>
                <sql:setDataSource 
                    driver="com.mysql.jdbc.Driver"
                    user = "root"
                    password=""
                    url = "jdbc:mysql://localhost/alfajava"
                    var="con"/>

                <%-- CRIA - SE A INSTRUÇAO SQL PARA O INSERT 
                    *** OS VALORES NÃO FORAM VALIDADOS É APENAS UM EXERCICIO 
                --%>

                <sql:update var="res" dataSource="${con}">
                    INSERT INTO CURSOS (nome , descricao, valor)
                    VALUES('${param.nom}', '${param.desc}',${param.val})
                </sql:update>

                    <c:if test="${res > 0}">
                        <strong>Curso cadastrado com sucesso!</strong>
                    </c:if>
            </c:catch>
            <c:if test="${ex != null}">
                Houve um problema <br/><!-- comment -->
                ${ex}
            </c:if>

        </c:if>
    </body>
</html>
