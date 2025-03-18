<%--
  Created by IntelliJ IDEA.
  User: mathe
  Date: 09/12/2024
  Time: 08:36
  To change this template use File | Settings | File Templates.
--%>

<%@ page import="dao.EquipamentosDao" %>
<%@ page import="model.Equipamento" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Editar Equipamento</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" defer></script>
    <link rel="stylesheet" href="../assets/css/equipamento-editar.css">
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
<h1 class="page_title">Editar equipamento</h1>
<%
    EquipamentosDao equipamentoDao = new EquipamentosDao();
    String id = request.getParameter("id");
    boolean sucesso = false;
    String mensagem = "";

    if (request.getParameter("editar") != null) {
        try {
            String tombo = request.getParameter("n_tombo");
            String equipamento = request.getParameter("equipamento");
            String marca = request.getParameter("marca");
            String modelo = request.getParameter("modelo");

            Equipamento equipamentoAlterado = new Equipamento(Integer.parseInt(id),equipamento, Integer.parseInt(tombo),  marca, modelo);
            equipamentoDao.alterar(equipamentoAlterado);
            mensagem = "Equipamento editado com sucesso!";
            sucesso = true;
        } catch (Exception e) {
            mensagem = "Erro ao salvar o equipamento!";
        }
    }

    Equipamento equipamento01 = null;

    if (id != null) {
        try {
            equipamento01 = equipamentoDao.consultar(Long.parseLong(id));
        } catch (Exception e) {
            mensagem = "Equipamento não encontrado!";
        }
    }

    if (equipamento01 != null && sucesso == false) {
%>
<form action="equipamento-cadastrar.jsp" method="post" class="page_form">
    <label for="n_tombo"><img src="../assets/imgs/settings.png"></label>
    <input type="text" placeholder="Tombo" id="n_tombo" class="form_input" name="n_tombo" value="<%=equipamento01.getN_tombo()%>" required>
    <br>
    <label for="equipamento"><img src="../assets/imgs/settings.png"></label>
    <input type="text" placeholder="Equipamento" id="equipamento" class="form_input" name="equipamento" value="<%=equipamento01.getEquipamento()%>" required>
    <br>
    <label for="marca"><img src="../assets/imgs/settings.png"></label>
    <input type="text" placeholder="Marca" id="marca" class="form_input" name="marca" value="<%=equipamento01.getMarca()%>" required>
    <br>
    <label for="modelo"><img src="../assets/imgs/settings.png"></label>
    <input type="text" placeholder="Modelo" id="modelo" class="form_input" name="modelo" value="<%=equipamento01.getModelo()%>" required>
    <br>
    <br>
    <div class="page_form_buttons">
        <button type="submit" name="editar" value="editar" class="page_btn">Editar</button>
        <button type="reset" class="page_btn">Resetar</button>
    </div>
</form>
<%
    }
%>
<%
    if (!mensagem.isEmpty()) {
%>
<p><strong><%= mensagem %></strong></p>
<%
    }
%>
<br>
</div>
</body>
</html>
