<%@taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib  uri ="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@include file="conex.jsp" %>
<%@include file="_header.jsp" %>

<div id="content">
    <h4>Lisa Cursos disponíveis: </h4>

    <%-- primeiramente eu importo as bibliotecas --%>

    <c:catch var="ex" >

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
</div>

<%@include  file="_footer.jsp" %>