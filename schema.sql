-- Estrutura do banco (Supabase / Postgres) do Arquivo de HDs
-- Hierarquia: HD -> Serviço -> Ponto

create table if not exists hds (
  id uuid primary key default gen_random_uuid(),
  nome text not null,
  capacidade_valor numeric,
  capacidade_unidade text default 'TB',
  serie text,
  categoria text,
  local text,
  notas text,
  created_at timestamptz default now()
);

create table if not exists servicos (
  id uuid primary key default gen_random_uuid(),
  hd_id uuid references hds(id) on delete cascade,
  nome text not null,
  created_at timestamptz default now()
);

create table if not exists pontos (
  id uuid primary key default gen_random_uuid(),
  servico_id uuid references servicos(id) on delete cascade,
  nome text not null,
  dias numeric,
  espaco_gb numeric,
  turno text,
  qtd_videos numeric,
  qtd_imagens numeric,
  observacoes text,
  created_at timestamptz default now()
);

-- Segurança (RLS): ligada nas três tabelas
alter table hds enable row level security;
alter table servicos enable row level security;
alter table pontos enable row level security;

-- Acesso sem login (qualquer pessoa com o link). Para exigir login, troque
-- "anon, authenticated" por "authenticated" e adicione uma tela de login.
create policy "acesso total hds" on hds
  for all to anon, authenticated using (true) with check (true);
create policy "acesso total servicos" on servicos
  for all to anon, authenticated using (true) with check (true);
create policy "acesso total pontos" on pontos
  for all to anon, authenticated using (true) with check (true);
