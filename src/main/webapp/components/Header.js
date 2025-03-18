class Header extends HTMLElement {
    constructor() {
        super();

        const shadow = this.attachShadow({ mode: "open" });

        shadow.appendChild(this.styles());

        shadow.innerHTML = `
            <header class="page_header">
                <div class="header_logo">
                    <img src="assets/imgs/obraGest-logo.png">
                </div>
                <div class="header_nav">
                    <ul class="header_nav_list">
                        <li><a href="jsp/equipamento-cadastrar.jsp">Cadastrar ferramenta</a></li>
                        <li><a href="jsp/equipamento-listar.jsp">Listar ferramentas</a></li>
                    </ul>
                </div>
            </header>
        `;
    }

    styles() {
        const style = document.createElement("style");
        style.textContent = `
            .page_header {
                height: 160px;
                width: 100%;
                background-color: rgba(173, 144, 144, 0.34);
                display: flex;
                flex-direction: row;
                justify-content: space-between;
                align-items: center;
            }

            .header_logo > img {
                max-width: 300px;
                max-height: 250px;
            }

            .header_nav_list {
                display: flex;
                flex-direction: row;
            }

            .header_nav_list > li {
                list-style: none;
                margin-right: 95px;
                font-family: Inter, sans-serif;
                font-size: 28px;
                font-weight: bold;
            }
        `;
        return style; // Corrigido para retornar a variável correta
    }
}

customElements.define("header-nav", Header);