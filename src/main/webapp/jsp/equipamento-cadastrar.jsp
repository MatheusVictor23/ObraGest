<%--
  Created by IntelliJ IDEA.
  User: mathe
  Date: 09/12/2024
  Time: 08:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="dao.EquipamentosDao" %>
<%@ page import="model.Equipamento" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Adicionar novo Equipamento</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" defer></script>
    <link rel="stylesheet" href="../assets/css/equipamento-cadastrar.css">
</head>
<body>
<header class="page_header">
    <div class="header_logo">
        <img src="../assets/imgs/obraGest-logo.png">
    </div>
    <div class="header_nav">
        <ul class="header_nav_list">
            <li><a href="../index.jsp">Home</a></li>
        </ul>
    </div>
</header>
<div class="page_body">
<h1 class="page_title">Cadastro de equipamento</h1>
<%
    String adicionar = request.getParameter("adicionar");
    String mensagem = "";
    boolean cadastroConcluido = false;

    if(adicionar != null){

        try {

            String tombo = request.getParameter("n_tombo");
            String equipamento = request.getParameter("equipamento");
            String marca = request.getParameter("marca");
            String modelo = request.getParameter("modelo");

            Equipamento equipamento01 = new Equipamento(equipamento,Integer.parseInt(tombo),marca,modelo);
            EquipamentosDao equipamentosDao = new EquipamentosDao();
            equipamentosDao.inserir(equipamento01);
            mensagem = "Dados salvos com sucesso!";
            cadastroConcluido = true;
        }
        catch(Exception e){
            mensagem = "Erro ao salvar!";
        }
    }

%>
<%
    if(cadastroConcluido) {
%>
<p><strong><%=mensagem%></strong></p>
<br>
<script>
    setTimeout(() => {
        location.href="../index.jsp"
    }, 3000);
</script>
<%
} else {
%>
<strong><%=mensagem%></strong>
<form action="equipamento-cadastrar.jsp" method="post" class="page_form">
    <label for="n_tombo"><img src="../assets/imgs/settings.png"></label>
    <input type="text" placeholder="Tombo" id="n_tombo" class="form_input" name="n_tombo" required>
    <br>
    <label for="equipamento"><img src="../assets/imgs/settings.png"></label>
    <input type="text" placeholder="Equipamento" id="equipamento" class="form_input" name="equipamento" required>
    <br>
    <label for="marca"><img src="../assets/imgs/settings.png"></label>
    <input type="text" placeholder="Marca" id="marca" class="form_input" name="marca" required>
    <br>
    <label for="modelo"><img src="../assets/imgs/settings.png"></label>
    <input type="text" placeholder="Modelo" id="modelo" class="form_input" name="modelo" required>
    <br>
    <br>
    <div class="page_form_buttons">
        <button type="submit" name="adicionar" class="page_btn">Cadastrar</button>
        <button type="reset" class="page_btn">Limpar</button>
    </div>
</form>
<%
    }
%>
</div>
</body>
</html>
</html>
