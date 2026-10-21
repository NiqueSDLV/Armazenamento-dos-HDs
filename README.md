# Arquivo de HDs

Catálogo de HDs externos com gravações de engenharia de tráfego.
Hierarquia: **HD → Serviço → Ponto**.

## Tecnologias
- HTML, CSS e JavaScript puros (sem build)
- [Supabase](https://supabase.com) (Postgres) como banco de dados
- [Vercel](https://vercel.com) para hospedagem, com deploy automático a cada push na branch `main`

## Estrutura
- `index.html`: aplicação completa
- `database/schema.sql`: tabelas e políticas de segurança do banco

## Segurança
O `index.html` usa apenas a chave pública (`publishable`) do Supabase, feita para ficar no navegador.
Nunca coloque a chave `secret`/`service_role` neste repositório.
O acesso atual é sem login: quem tiver o link consegue ler e editar os dados.

## Atualizar o site
Edite os arquivos, faça commit e push na `main`. O Vercel publica a nova versão sozinho.
