# Rigoberta Architecture Map

This document maps how Rigoberta is structured today so changes can be planned against real boundaries.

## 1) System Context

- App type: Rails service (`rails ~> 8.0`) with server-rendered HTML + JSON endpoints.
- Primary domain: `Article` and nested `Comment`.
- Realtime behavior: Turbo stream subscriptions on article pages; comment creation broadcasts to article subscribers.
- Backing services:
  - PostgreSQL (`db` service in Compose)
  - Redis (`redis` service in Compose) for Action Cable and Sidekiq ecosystem
  - Prometheus exporter components via Yabeda integrations

## 2) Runtime Components

- Web process:
  - Entrypoint: `bin/rails s` (Compose `web` service)
  - App server: Puma (`config/puma.rb`)
  - Serves MVC requests and Action Cable endpoint
- Data layer:
  - Active Record on PostgreSQL (`config/database.yml`)
  - Core tables: `articles`, `comments`
  - Rails platform tables: Action Text + Active Storage tables
- Realtime layer:
  - `config/cable.yml` uses Redis in development/production
  - `Comment` model declares `broadcasts_to :article`
  - Article show page subscribes with `turbo_stream_from @article`
- Async/Jobs layer:
  - Sidekiq gem is present with a server initializer for metrics
  - No explicit `active_job.queue_adapter` set in environments (defaults apply)
- Observability layer:
  - Puma Yabeda plugins enabled outside dev/test
  - Metrics exporter URL uses `METRICS_PORT` (default `9394`)
  - Prometheus multiprocess files stored in `tmp/prometheus_metrics`

## 3) Request and Data Flows

### A. Read Article (HTML)
1. Client requests `GET /articles/:id`
2. `ArticlesController#show` loads record
3. View renders article + comments partial
4. View opens Turbo stream subscription for that article

### B. Create Comment
1. Client submits nested form `POST /articles/:article_id/comments`
2. `CommentsController#create` creates comment under article
3. `Comment` broadcast publishes to the article stream
4. Subscribed clients receive realtime update
5. Request redirects back to article page

### C. Create/Update Article
1. Client submits article form to `ArticlesController`
2. Controller persists via Active Record
3. HTML redirects and JSON responses are both supported

## 4) Route Surface

- `root` -> `welcome#index`
- `resources :articles`
- Nested `resources :comments` under articles

## 5) Boundaries and Ownership

- Controllers own HTTP orchestration and response formats.
- Models own associations, validation, and broadcast hooks.
- Views own page composition and Turbo stream subscriptions.
- Initializers and environment config own integration behavior (Redis, Prometheus, Puma plugins).

## 6) Operational Ports/Config

- Web app: `3000`
- PostgreSQL: `5432`
- Metrics endpoint (non-dev/test): `9394` default (`METRICS_PORT`)
- Key env dependencies:
  - `DATABASE_URL` (production)
  - `REDIS_URL` (production cable default)
  - `RAILS_LOG_TO_STDOUT`, `RAILS_SERVE_STATIC_FILES`, `METRICS_PORT`

## 7) Current Drift / Risks to Track

- `config/application.rb` still sets `config.load_defaults 7.0` while Gemfile targets Rails 8.
- Schema header is `ActiveRecord::Schema[7.0]`; expected while app is partially upgraded but worth intentional tracking.
- Sidekiq is integrated for metrics, but job adapter/runtime process definition is not fully documented in this repo.

## 8) Change Planning Anchors

When implementing new features, decide first which layer changes:
- HTTP/API behavior: controllers + routes + request specs
- Domain rules: models + model specs
- Realtime UX: Turbo stream templates + broadcast hooks
- Platform/ops behavior: Compose, environment config, Puma/initializer setup
