# Sistema SOS Pets

O **Sistema SOS Pets** é uma aplicação Full Stack desenvolvida para a gestão de clínicas veterinárias. O sistema facilita o controlo de pacientes (pets), tutores, funcionários, serviços e agendamento de atendimentos.

O projeto é composto por uma API REST robusta no backend e uma interface moderna no frontend.
# https://sospets.onrender.com

## Tecnologias Utilizadas

### Backend (API)
* **Java** (Spring Boot Framework)
* **Spring Data JPA** (Persistência de dados)
* **H2 Database** (Base de dados em memória para desenvolvimento)
* **Maven** (Gestão de dependências e build)
* **Docker** (Containerização da aplicação)

### Frontend (Interface)
* **React.js**
* **JavaScript (ES6+)**
* **CSS3**
* **NPM** (Gestor de pacotes)

---

## Funcionalidades

O sistema permite o registo e gestão (CRUD) das seguintes entidades:

* **Tutores:** Cadastro de proprietários.
* **Animais:** Gestão de pacientes (incluindo porte, espécie, cor).
* **Atendimentos:** Registo de consultas e procedimentos veterinários.
* **Clínicas:** Administração das unidades de atendimento.
* **Funcionários:** Cadastro da equipa (veterinários, rececionistas, etc.).
* **Serviços:** Catálogo de serviços oferecidos pela clínica.
* **Relatórios:** Visualização consolidada das atividades.

---

## Estrutura do Projeto

```text
sistema-sos-pets/
├── backend/            # API Spring Boot
│   ├── src/            # Código fonte Java (Controllers, Entities, Services)
│   ├── Dockerfile      # Configuração Docker
│   └── pom.xml         # Dependências Maven
│
└── sospets-react/      # Interface React
    ├── public/         # Ficheiros estáticos
    ├── src/            # Componentes e Páginas (Pages)
    └── package.json    # Dependências Node
````

-----

## Como Executar o Projeto

Apenas acesse o link: https://sospets.onrender.com

-----

## Como Executar com Docker

O [Dockerfile](Dockerfile) na raiz do projeto builda o frontend (React) e o backend (Spring Boot) juntos, gerando uma única imagem que serve os dois na porta `8080`. O container roda com o perfil `docker`, que usa um banco H2 em memória (não precisa de Postgres externo).

```bash
# 1. Build da imagem (executar na raiz do repositório)
docker build -t sospets:latest .

# 2. Rodar o container
docker run -d --name sospets-app -p 8080:8080 sospets:latest

# 3. Acompanhar os logs
docker logs -f sospets-app

# 4. Acessar
# Frontend: http://localhost:8080
# API:      http://localhost:8080/tutores

# 5. Parar e remover o container
docker rm -f sospets-app
```

Se a porta `8080` já estiver em uso na sua máquina, troque o mapeamento para, por exemplo, `-p 8081:8080` e acesse pela porta `8081`.

-----

## Configuração

As configurações da aplicação encontram-se em `backend/src/main/resources/application.properties`.
O projeto possui perfis configurados (`application-local.properties` e `application-prod.properties`) para facilitar a troca entre ambiente de desenvolvimento e produção.

-----