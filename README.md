# Agenda Testes E2e

Integrators Tests e2e with robot

## Qual o objetivo deste repositório?

## Quais são os outros repositórios desta solução?

---

<p align="center">
  Adicione aqui badges de qualidade do código
</p>

---

## Environments

| Environment | URL                                                                    |
| ----------- | ---------------------------------------------------------------------- |
| dev         | <https://dagenda-testes-e2e.produto-financeiro.grupoboticario.digital> |
| hml         | <https://hagenda-testes-e2e.produto-financeiro.grupoboticario.digital> |
| prd         | <https://agenda-testes-e2e.produto-financeiro.grupoboticario.digital>  |

## Setup

1. Para gerenciar as versões de python e a criação de virtualenvs, instale essas duas ferramentas:

   - [pyenv](https://github.com/pyenv/pyenv)
   - [pyenv-virtualenv](https://github.com/pyenv/pyenv-virtualenv)

2. Verifique a versão corrente do projeto no arquivo .python-version e instale caso necessário

   ```bash
   pyenv install
   ```

3. Crie um virtualenv para o projeto

   ```bash
   pyenv virtualenv agenda_testes_e2e
   ```

4. Ative o virtualenv

   ```bash
   pyenv activate agenda_testes_e2e
   ```

5. Configure as dependência privadas

   [Obtenha o suas credenciais de acesso](https://dev.gb.tech/docs/default/component/stack-tecnologia-gb/backend/python/#gestao-de-dependencia)
   e execute:

   ```bash
   poetry config http-basic.BoticarioFeed [seu usuário] [sua senha]
   ```

6. Instale as dependencias do projeto

   ```bash
   make dev-dependencies
   ```

## Changelog

## Crie um novo fragmento (feature, bugfix, doc, removal ou misc)

```bash
npx news-fragments create <fragment_type> "your_message"
```

Após confirmar o tipo e a mensagem do fragmento, um novo arquivo será gerado na pasta `./fragments`.
Sendo assim, ao fechar uma nova versão de lançamento da API, todos os fragmentos existentes na pasta, serão compilados dentro do arquivo `./CHANGELOG.md`.

## Gerando uma nova versão de projeto.

1. Instale o [nvm](https://github.com/nvm-sh/nvm)
2. Habilite a versão de node para o projeto com o comando `nvm use`
3. Instale as dependências de node para o projeto

   ```bash
   npm install
   ```

4. Gere uma nova versão do projeto seguindo os passos do `release-it` e o padrão do [semver](https://semver.org/)

   ```bash
   npx release-it
   ```
