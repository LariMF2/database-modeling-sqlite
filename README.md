# 🗄️ Modelação de Bases de Dados Relacionais & SQLite

Este repositório reúne um conjunto de exercícios, projetos práticos e estudos de caso focados em **Modelação de Bases de Dados Relacionais**, **Normalização de Dados** e escrita de **Consultas SQL** utilizando **SQLite**.

Projeto desenvolvido no âmbito da unidade curricular *UC00602 - Modelar Bases de Dados Relacionais*.

---

## 🚀 Conteúdo do Repositório

### 1. 📐 Modelação e Normalização (Estudos de Caso)
- **Normalização até 3FN:** Análise de tabelas com dependências funcionais parciais e transitivas, convertendo-as para a 1FN, 2FN e 3FN para eliminar redundâncias e anomalias de atualização.
- **Chaves Compostas:** Definição e aplicação de chaves primárias compostas para validar restrições de negócio (ex: reservas de lugares e atribuições de karts).

### 2. 💻 Scripts e Consultas SQL (`/01-esquemas-e-consultas-sql`)
- **Gestão de Clientes e Encomendas:** Modelação de relacionamentos 1:N com chaves estrangeiras.
- **Professores e Disciplinas:** Relacionamentos N:M através de tabelas de junção/ligação e consultas com `JOIN` e ordenação.
- **Reservas e Atribuições:** Aplicação de restrições de integridade e consultas filtradas com `LIKE`, `WHERE` e `ORDER BY`.
- **Cursos, Formadores e Inscrições:** Gestão completa de registos (criação de tabelas com `PRAGMA foreign_keys = ON`, `UPDATE`, `DELETE`, `LEFT JOIN` e junções agregadas).

---

## 🛠️ Tecnologias e Conceitos Aplicados

- **SGBD:** SQLite
- **Linguagem:** SQL (DDL e DML)
- **Conceitos:**
  - Integridade Referencial (`FOREIGN KEY`, `PRIMARY KEY`)
  - Chaves Primárias Compostas
  - Junções (`INNER JOIN`, `LEFT JOIN`)
  - Agregações e Filtros (`COUNT`, `GROUP BY`, `DISTINCT`, `LIKE`)
  - Formas Normais (1FN, 2FN, 3FN)

---

## 📂 Como Executar os Scripts

1. Faça o clone do repositório:
   ```bash
   git clone [https://github.com/LariMF2/database-modeling-sqlite.git](https://github.com/LariMF2/database-modeling-sqlite.git)