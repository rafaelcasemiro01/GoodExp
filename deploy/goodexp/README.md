# GoodExp — Landing Page

Landing page estática (HTML/CSS/JS puro) com formulário de leads salvando no Supabase. Pronta para deploy na Vercel.

## Arquivos

| Arquivo | O que é |
|---|---|
| `index.html` | A landing page completa (layout, tabs de serviços, FAQ, formulário) |
| `config.js` | URL e anon key do seu projeto Supabase (edite antes do deploy) |
| `supabase.sql` | SQL que cria a tabela `leads` com segurança RLS |
| `logo.svg` | Logo GoodExp (tile roxo) — usada como favicon |
| `logo-light.svg` | Versão do símbolo para fundos claros |

## Passo a passo

### 1. Supabase (banco de dados)
1. Crie uma conta em [supabase.com](https://supabase.com) e um novo projeto (região `South America (São Paulo)`).
2. No menu lateral: **SQL Editor → New query** → cole o conteúdo de `supabase.sql` → **Run**.
3. Em **Project Settings → API**, copie a **Project URL** e a **anon public key**.
4. Abra `config.js` e substitua os dois valores.

> A anon key é pública por design — a segurança vem da política RLS criada no SQL: visitantes só conseguem **inserir** leads, nunca ler ou apagar. Os leads você vê no **Table Editor** do Supabase.

### 2. GitHub (repositório) — no terminal do VSCode
Abra esta pasta no VSCode (`File → Open Folder`) e no terminal (`` Ctrl+` ``):

```bash
git init
git add .
git commit -m "GoodExp landing page"
```

Crie o repositório no GitHub (via [github.com/new](https://github.com/new) ou GitHub CLI):

```bash
# com GitHub CLI (gh auth login antes):
gh repo create goodexp-landing --private --source=. --push

# ou manualmente, depois de criar o repo vazio no site:
git remote add origin https://github.com/rafaelcasemiro01/GoodExp.git
git branch -M main
git push -u origin main
```

### 3. Vercel (hospedagem)
1. Acesse [vercel.com](https://vercel.com) e entre com a conta do GitHub.
2. **Add New → Project** → importe `goodexp-landing`.
3. Framework Preset: **Other** (site estático, sem build). Deploy.
4. Pronto — a cada `git push` na `main`, a Vercel publica automaticamente.

Domínio próprio (ex.: `goodexp.com.br`): **Project → Settings → Domains** na Vercel.

### 4. Testar o formulário
Envie um lead pelo site publicado e confira em **Supabase → Table Editor → leads**.

## Observações
- Site 100% estático: não há variáveis de ambiente de build — a configuração pública fica em `config.js` (padrão correto para sites estáticos com Supabase + RLS).
- Se `config.js` ainda estiver com placeholders, o formulário não quebra: mostra sucesso e loga o lead no console (modo de teste).
- Botões de WhatsApp apontam para `wa.me/5514996169791`.
