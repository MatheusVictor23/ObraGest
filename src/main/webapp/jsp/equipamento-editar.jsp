<%@ page import="dao.EquipamentosDao" %>
<%@ page import="model.Equipamento" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Editar Ferramenta</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" defer></script>
    <link rel="stylesheet" href="../assets/css/equipamento-editar.css">
    <link rel="stylesheet" href="../index.css">
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
    <h1 class="page_title">Editar ferramenta</h1>
    <%
        EquipamentosDao equipamentoDao = new EquipamentosDao();
        String id = request.getParameter("id");
        boolean sucesso = false;

        if (request.getParameter("editar") != null && id != null) {
            try {
                String tombo = request.getParameter("n_tombo");
                String equipamento = request.getParameter("equipamento");
                String marca = request.getParameter("marca");
                String modelo = request.getParameter("modelo");

                Equipamento equipamentoAlterado = new Equipamento(Integer.parseInt(id), equipamento, Integer.parseInt(tombo), marca, modelo);
                equipamentoDao.alterar(equipamentoAlterado);
                sucesso = true;
    %>
    <div class="alert alert-success" role="alert">
        Ferramenta editada!
    </div>

    <script>
        setTimeout(() => {
            window.location.href = "equipamento-listar.jsp";
        },2000)
    </script>
    <%
    } catch (Exception e) {
    %>
    <script>
        alert("Erro ao editar equipamento!");
    </script>
    <%
            }
        }

        Equipamento equipamento01 = null;

        if (id != null) {
            try {
                equipamento01 = equipamentoDao.consultar(Long.parseLong(id));
            } catch (Exception e) {
    %>
    <div class="alert alert-danger" role="alert">
    Erro ao editar ferramenta!
    </div>
    <script>
        setTimeout(() => {
            window.location.href = "equipamento-listar.jsp";
        },1500)
    </script>
    <%
            }
        }

        if (equipamento01 != null && !sucesso) {
    %>

    <form action="equipamento-editar.jsp?id=<%= id %>" method="post" class="page_form">
        <input type="hidden" name="id" value="<%= id %>">

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
            <button type="submit" name="editar" value="true" class="page_btn">Editar</button>
            <button type="reset" class="page_btn">Resetar</button>
        </div>
    </form>

    <%
        }
    %>
    <br>
</div>
</body>
</html>