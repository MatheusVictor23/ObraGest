<%--
  Created by IntelliJ IDEA.
  User: mathe
  Date: 09/12/2024
  Time: 09:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="dao.EquipamentosDao"%>
<%@ page import="model.Equipamento"%>
<%@ page import="java.util.List" %>

<html>
<head>
    <title>Lista de equipamentos</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="../assets/css/equipamento-listar.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" defer></script>
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
<h1 class="text-center mt-4">Lista de equipamentos</h1>

<%
    EquipamentosDao equipamentosDao = new EquipamentosDao();

    List<Equipamento> equipamentos = equipamentosDao.listar();
%>
<table border="1">
    <th>ID</th>
    <th>Tombo</th>
    <th>Equipamento</th>
    <th>Marca</th>
    <th>Modelo</th>

    <% for(Equipamento equipamento : equipamentos){ %>
    <tr> <%-- Cria uma linha para cada pessoa --%>
        <td>
            <a href="equipamento-consultar.jsp?id=<%=equipamento.getId()%>"><%=(equipamento.getId())%></a>
        </td>
        <td>
            <%=(equipamento.getN_tombo())%>
        </td>
        <td>
            <%=(equipamento.getEquipamento())%>
        </td>
        <td>
            <%=(equipamento.getMarca())%>
        </td>
        <td>
            <%=(equipamento.getModelo())%>
        </td>
    </tr>
    <% } %>
</table>
<br>
<button onclick="location.href='equipamento-cadastrar.jsp'" class="btn btn-primary">Adicionar novo Equipamento</button>

</body>
</html>
