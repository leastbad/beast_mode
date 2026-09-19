# Beast Mode StimulusReflex

A server-rendered faceted search UI demo for Rails: filter, sort, and paginate `Customer` records with [StimulusReflex](https://docs.stimulusreflex.com) and [AllFutures](https://github.com/leastbad/all_futures).

Live demo (if still up): [beastmode.leastbad.com](https://beastmode.leastbad.com)

## Stack

- Ruby **3.4.10** / Rails **8.1**
- Stimulus only (no Turbo)
- Public **StimulusReflex 3.5.5** + **CableReady 5.0.6** (Ruby gem and npm package versions matched)
- **AllFutures ~> 2.0** from RubyGems (explicit `create` / `find` / `save`)
- JS via **esbuild** (`jsbundling-rails`); CSS from `public/css/`
- Redis for ActionCable, cache, sessions (`redis-session-store`), and AllFutures via Kredis

## Prerequisites

- Ruby 3.4.10 (see `.ruby-version`)
- Node **20+** (see `.nvmrc`; `nvm use`)
- PostgreSQL with `pg_trgm` available for seeds/search
- Redis (`REDIS_URL`, default `redis://127.0.0.1:6379/1`)

## Installation

```sh
git clone https://github.com/leastbad/beast_mode.git
cd beast_mode
nvm use
bundle install
yarn install && yarn build
bin/rails db:prepare db:seed
bin/dev
```

Open [http://localhost:3000](http://localhost:3000).

`bin/dev` starts Puma and `yarn build:watch` via Foreman (loads RVM + nvm from `.ruby-version` / `.nvmrc`).

Without Foreman: `yarn build && bin/rails s` (after `rvm use` / correct Ruby on `PATH`).

### Environment

| Variable | Default |
|----------|---------|
| `DATABASE_URL` | `postgres://127.0.0.1:5432/beast_mode_development` |
| `REDIS_URL` | `redis://127.0.0.1:6379/1` |

## Notes

- Facet state lives in an AllFutures `CustomerFilter` (Redis). Refresh the page to mint a new filter.
- Table-row morphs must wrap rows in a real `<tbody id="customers">…</tbody>`. StimulusReflex’s `morph customers` helper wraps collections in a `<div>`, and HTML5 parsing then strips `<tr>`/`<td>` — see `CustomersReflex#facet`.
- `slim-select` is pulled from a public GitHub fork in `package.json`.
- A Docker Compose setup still exists under `bin/docker/` but is **not** the maintained path for this Rails 8.1 upgrade; prefer local Postgres + Redis.

## Production (Kamal)

The live host is a Hetzner CX23 (`beastmode.leastbad.com`) with Postgres + Redis as Kamal accessories.

Deploys currently run **on the server** (this WSL environment has no local Docker daemon):

```sh
rsync -az --exclude node_modules --exclude tmp --exclude log --exclude .git \
  -e "ssh -i ~/.ssh/id_ed25519_hetzner -o IdentitiesOnly=yes" \
  ./ root@204.168.227.116:/opt/beast_mode/
ssh -i ~/.ssh/id_ed25519_hetzner root@204.168.227.116 \
  'cd /opt/beast_mode && kamal deploy --version=$(date +%Y%m%d%H%M%S)'
```

Secrets: `config/master.key` and `.kamal/postgres_password` (gitignored) must exist on the server under `/opt/beast_mode`.
