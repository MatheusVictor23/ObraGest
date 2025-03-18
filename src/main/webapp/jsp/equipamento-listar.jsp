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

<!DOCTYPE html>
<html>
<head>
    <title>Lista de equipamentos</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="../assets/css/equipamento-listar.css">
    <link rel="stylesheet" href="../index.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" defer></script>

    <script>
        function confirmarExclusao(id) {
            if (confirm("Tem certeza que deseja excluir este equipamento?")) {
                window.location.href = "equipamento-listar.jsp?excluir=true&id=" + id;
            }
        }
    </script>

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
<div class="page_body">
    <h1 class="page_title">Lista de equipamentos</h1>

    <%
        EquipamentosDao equipamentosDao = new EquipamentosDao();
        List<Equipamento> equipamentos = equipamentosDao.listar();

        String id = request.getParameter("id");
        String excluir = request.getParameter("excluir");

        if (excluir != null && id != null) {
            try {
                equipamentosDao.excluir(Long.parseLong(id));
    %>
    <div class="alert alert-success" role="alert">
        Equipamento excluido!
    </div>

    <script>
        setTimeout(() => {
            window.location.href = "equipamento-listar.jsp";
        },2000)
    </script>
    <%
    } catch (Exception e) {
    %>
    <div class="alert alert-warning" role="alert">
        Erro ao excluir!
    </div>

    <script>
        setTimeout(() => {
            window.location.href = "equipamento-listar.jsp";
        },1500)
    </script>
    <%
            }
        }
    %>

    <table class="table table-striped">
        <th scope="col">ID</th>
        <th scope="col">Tombo</th>
        <th scope="col">Equipamento</th>
        <th scope="col">Marca</th>
        <th scope="col" colspan="3">Modelo</th>

        <% for (Equipamento equipamento : equipamentos) { %>
        <tr>
            <th scope="row">
                <a href="equipamento-consultar.jsp?id=<%=equipamento.getId()%>"><%=equipamento.getId()%></a>
            </th>
            <td><%=equipamento.getN_tombo()%></td>
            <td><%=equipamento.getEquipamento()%></td>
            <td><%=equipamento.getMarca()%></td>
            <td><%=equipamento.getModelo()%></td>
            <td style="display: flex; flex-direction: row">
                <a href="equipamento-editar.jsp?id=<%=equipamento.getId()%>" style="margin-right: 10px">
                    <img src="../assets/imgs/pencil.png">
                </a>
                <button onclick="confirmarExclusao(<%=equipamento.getId()%>)" style="background: none; border: none;">
                    <img src="../assets/imgs/trash.png">
                </button>
            </td>
        </tr>
        <% } %>
    </table>
    <br>
    <button onclick="location.href='equipamento-cadastrar.jsp'" id="button_new">Novo equipamento</button>
</div>
</body>
</html>

