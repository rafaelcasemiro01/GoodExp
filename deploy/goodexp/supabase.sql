-- Tabela de leads da landing page GoodExp
-- Rode no Supabase: Dashboard → SQL Editor → New query → cole e Run.

create table if not exists public.leads (
  id uuid primary key default gen_random_uuid(),
  criado_em timestamptz not null default now(),
  nome text not null,
  whatsapp text not null,
  servico text not null
);

-- Segurança (RLS): visitantes anônimos podem APENAS inserir.
-- Ninguém lê os leads pelo site — você vê pelo Dashboard (Table Editor).
alter table public.leads enable row level security;

create policy "landing pode inserir leads"
  on public.leads for insert
  to anon
  with check (true);
