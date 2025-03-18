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
<html>
<head>
    <title>Adicionar novo Equipamento</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="../assets/css/equipamento-cadastrar.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" defer></script>
</head>
<body>
<h1>Cadastro de equipamento</h1>
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
<%
    if(cadastroConcluido) {
%>
<p><strong><%=mensagem%></strong></p>
<br>
<button onclick="location.href='../index.jsp'">Voltar</button>

<%
} else {
%>
<strong><%=mensagem%></strong>
<form action="equipamento-cadastrar.jsp" method="post">
    <label for="n_tombo">Tombo do equipamento:</label>
    <input type="text" id="n_tombo" name="n_tombo" required>
    <br>
    <label for="equipamento">Equipamento:</label>
    <input type="text" id="equipamento" name="equipamento" required>
    <br>
    <label for="marca">Marca:</label>
    <input type="text" id="marca" name="marca" required>
    <br>
    <label for="modelo">Modelo:</label>
    <input type="text" id="modelo" name="modelo" required>
    <br>
    <br>
    <button type="submit" name="adicionar">Cadastrar</button>
    <button type="reset">Resetar</button>
    <button onclick="location.href='equipamento-listar.jsp'">Voltar</button>

</form>
<%
    }
%>

</body>
</html>
</html>
