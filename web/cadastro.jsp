<%@include  file="_header.jsp" %>

<div id="content">
    <h4>Formulario para gravar recado </h4>

    <form action="exec" method="post">
        Informe o nome: </br><!-- comment -->
        <input type="text" name="nom"/>
        <br/><br/><!-- comment -->
        Detalhes do Curso: </br><!-- comment -->
        <textarea name="desc" rows="5" cols="30"></textarea>
        <br/><br/><!-- comment -->
         Valor : </br><!-- comment -->
        <input type="text" name="val"/>
        <br/><br/><!-- comment -->
        <input type="submit" name="sub" value="Cadastrar"/>


    </form>
</div>
<%@include file="_footer.jsp" %>