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
<form action="equipamento-editar.jsp" method="post">
    <input type="hidden" name="id" value="<%=equipamento01.getId()%>">
    <label for="n_tombo">Tombo do equipamento:</label>
    <input type="text" id="n_tombo" name="n_tombo" value="<%=equipamento01.getN_tombo()%>" required>
    <br>
    <label for="equipamento">Equipamento:</label>
    <input type="text" id="equipamento" name="equipamento" value="<%=equipamento01.getEquipamento()%>" required>
    <br>
    <label for="marca">Marca:</label>
    <input type="text" id="marca" name="marca" value="<%=equipamento01.getMarca()%>" required>
    <br>
    <label for="modelo">Modelo:</label>
    <input type="text" id="modelo" name="modelo" value="<%=equipamento01.getModelo()%>" required>
    <br><br>
    <button type="submit" name="editar" value="editar">Editar</button>
    <button type="reset">Resetar</button>
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
<button onclick="location.href='equipamento-listar.jsp'">Voltar</button>
</body>
</html>
