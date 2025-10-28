# data-implementation-challenge-teamguide
# 🧩 Desafio Técnico — Importação de PDI (Plano de Desenvolvimento Individual)

Este repositório apresenta a solução desenvolvida por **Lucas Lima** como parte de um **desafio técnico de Data Implementation**, cujo objetivo era estruturar, validar e documentar o processo de **importação de PDIs (Planos de Desenvolvimento Individual)** em um ambiente de dados corporativo.

> ⚠️ **Observação Importante:**  
> Todos os dados, nomes de empresas e personagens utilizados neste desafio são **fictícios e apenas ilustrativos**.  
> Este projeto foi criado **para fins educacionais e de portfólio**, não representando informações reais de clientes ou empresas.

---

## 🚀 Objetivo do Desafio

Simular o processo de importação de dados de PDIs em uma base relacional, garantindo:
- Estruturação correta das tabelas no banco de dados;
- Criação de planilha padrão para importação;
- Aplicação de regras de validação de dados;
- Documentação explicativa para clientes e usuários finais.

---

## 🗂️ Estrutura do Projeto

O projeto foi dividido em três entregáveis principais:

### **1️⃣ Planilha de Importação PDI**
Planilha Excel construída com validações de dados e estrutura padronizada, incluindo:
- Identificação única do colaborador (CPF ou e-mail);
- Informações do PDI e suas ações vinculadas;
- Colunas com status válidos (`PENDING`, `IN_PROGRESS`, `CONCLUDED`);
- Regras de obrigatoriedade e formato de datas (`YYYY-MM-DD`);
- Mensagens de orientação configuradas nas validações.

🧾 **Arquivo:** `Planilha_Importacao_PDI_Modelo.xlsx`

---

### **2️⃣ Documentação Explicativa**
Documento Word contendo as instruções detalhadas para preenchimento da planilha e entendimento das regras de negócio:
- Como preencher a planilha (passo a passo);
- Regras de associação entre Colaborador → PDI → Ações;
- Campos obrigatórios e opcionais;
- Chaves de correspondência (ex.: `employee_id`, `pdi_id`, `action_id`);
- Premissas e limitações assumidas.

📘 **Arquivo:** `Guia_Explicativo_Planilha_PDI_TeamGuide.docx`

---

### **3️⃣ E-mail Explicativo ao Cliente**
Modelo de e-mail profissional destinado ao cliente fictício, explicando:
- Como preencher a planilha de importação;
- Quais campos são obrigatórios e opcionais;
- Principais observações de preenchimento;
- Passos para envio e validação final do arquivo.

📧 **Arquivo:** `Email_Explicativo_Importacao_PDI_KeepTalents.docx`

---

## 🧠 Lógica Técnica Implementada

Durante o desafio, foram aplicados conceitos de:
- **Modelagem relacional de dados** (entidades: colaboradores, PDIs, ações, times, líderes etc.);
- **Criação de constraints e chaves estrangeiras** no banco PostgreSQL;
- **Validação de integridade referencial** (garantindo consistência entre tabelas);
- **Consultas SQL** para extração de informações gerenciais (como headcount ativo e status de PDIs);
- **Uso de views** para simplificação de análises e relatórios;
- **Boas práticas de normalização e documentação técnica.**

---

## 💼 Tecnologias Utilizadas

| Tipo | Ferramenta / Linguagem |
|------|------------------------|
| Banco de Dados | PostgreSQL |
| Planilhas | Microsoft Excel (validação de dados) |
| Documentação | Microsoft Word |
| Versionamento | Git / GitHub |
| Linguagem | SQL (com foco em legibilidade e simplicidade) |

---

## ⚙️ Premissas e Limitações

- Considera-se que os colaboradores já existam previamente no sistema.  
- A ausência de ações não invalida o PDI, mas limita o detalhamento.  
- Todos os campos obrigatórios devem ser preenchidos para evitar erros na importação.  
- O modelo foi projetado para bancos de dados relacionais simples (como PostgreSQL e MySQL).  

---

## 🧾 Licença e Uso Ético

Este projeto foi desenvolvido **exclusivamente para fins de aprendizado e demonstração técnica**.  
Você pode utilizá-lo como referência de estudo, desde que mantenha os devidos créditos ao autor.

> 🔒 Nenhum dado real de empresa ou cliente foi utilizado neste projeto.  
> Todo o conteúdo foi adaptado a partir de um **desafio técnico fictício** de contexto profissional.

---

## 👨‍💻 Autor

**Lucas Oliveira Soares Lima**  
📍 Estudante de Análise e Desenvolvimento de Sistemas | Data Analytics com IA  
💼 Interesse em Data Implementation, Data Analytics e DevOps com foco em segurança  
🔗 [LinkedIn](www.linkedin.com/in/lucas-lima-6113ab355)

---


