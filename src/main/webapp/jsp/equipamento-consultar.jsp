<%--
  Created by IntelliJ IDEA.
  User: mathe
  Date: 09/12/2024
  Time: 08:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="model.Equipamento"%>
<%@ page import="dao.EquipamentosDao" %>

<!DOCTYPE html>
<html>
<head>
    <title>Consultar Equipamento</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="../assets/css/equipamento-consultar.css">
    <link rel="stylesheet" href="../index.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" defer></script>
</head>
<body class="page_body">
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
    EquipamentosDao equipamentosDao = new EquipamentosDao();
    String id = request.getParameter("id");
    String mensagem = "";
    Equipamento equipamento = null;

    if (id != null) {
        try {
            equipamento = equipamentosDao.consultar(Long.parseLong(id));
        } catch (Exception e) {
            mensagem = "Equipamento não encontrado!";
        }
    }

    String excluir = request.getParameter("excluir");
    if (excluir != null) {
        try {
            equipamentosDao.excluir(Long.parseLong(id));
            mensagem = "Equipamento excluído com sucesso!";
            equipamento = null;
        } catch (Exception e) {
            mensagem = "Erro ao excluir o equipamento.";
        }
    }
%>

<h1>Consultar Equipamento</h1>

<%
    if (equipamento != null) {
%>
<p><strong>Tombo:</strong> <%= equipamento.getN_tombo() %></p>
<p><strong>Equipamento:</strong> <%= equipamento.getEquipamento() %></p>
<p><strong>Marca:</strong> <%= equipamento.getMarca() %></p>
<p><strong>Modelo:</strong> <%= equipamento.getModelo() %></p>

<form method="post">
    <button type="button" class="page_btn" onclick="location.href='equipamento-editar.jsp?id=<%= equipamento.getId() %>'">Editar Equipamento</button>
    <button type="submit" class="page_btn" name="excluir" value="true">Excluir Equipamento</button>
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
</body>
</html>
