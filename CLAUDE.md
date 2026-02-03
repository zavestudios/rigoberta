# Project Context for AI Assistants

## Purpose
Reference Rails 7 service template demonstrating modern development practices: CI, security, Docker-first workflow. "This is how I build a modern Rails service in 2026."

## Current State
Resurrection complete. CI pipeline operational with test, lint, security, and image build workflows. Docker Compose development environment stable.

## Key Files
- `README.md` - Project narrative and goals
- `docker-compose.yml` - PostgreSQL + Rails + Redis services
- `app/` - Rails 7 application
- `.github/workflows/` - CI/CD workflows (test, lint, security, image-build)
- `docs/` - Documentation for Hugo module integration

## Working With This Repo

**Local development:**
```bash
# Initial setup
cp .env.example .env
docker compose build
docker compose run --rm web bin/rails db:setup

# Start services
docker compose up

# Rails console
docker compose exec web bin/rails c
# Or one-off: docker compose run --rm web bin/rails c

# Run tests
docker compose run --rm web bin/rspec

# Update gems
docker compose run --rm web bundle update
docker compose up --build
```

**Tech stack:**
- Rails 7
- Ruby 3
- PostgreSQL
- Redis
- Docker + Docker Compose

## Architecture

**Design Philosophy:**
- Small, teachable, inspectable
- Mental models first, implementation second
- CI, security, Docker as part of happy path
- Document the "why" as much as the "how"

**What This Is:**
- Gold-standard Rails 7 template
- Living example of best practices
- Companion to write-ups on modern Rails development

**What This Is NOT:**
- Feature-rich product
- Long-lived monolith
- Experimental grab-bag

## Related Repos
- **zavestudios** - Parent documentation hub
- **platform-pipelines** - CI/CD workflows (Rails test/lint, security - to be integrated)
- **pg-multitenant** - Target database platform (future)

## Completed Resurrection
All resurrection phases complete:
- ✅ Inventory and docs baseline
- ✅ Dependency and security refresh
- ✅ Docker Compose happy path validated
- ✅ Test and lint baseline established
- ✅ GitHub Actions CI pipeline (test, lint, security, image build)
- ✅ Release discipline documented

## CI/CD
GitHub Actions workflows (in `.github/workflows/`):
- `test.yml` - RSpec with PostgreSQL
- `lint.yml` - RuboCop static analysis
- `security.yml` - Brakeman and bundler-audit scans
- `image-build.yml` - Docker image build on merge to main

---

## Maintaining This File

**When to update:**
- CI/CD workflows modified (update CI/CD section)
- New architectural patterns added (update Design Philosophy)
- Tech stack changes (Rails/Ruby version upgrades)
- Platform deployment changes (namespace, database tenant)

**What NOT to include:**
- Detailed setup instructions (belongs in README.md)
- Feature requests or bug tracking (belongs in GitHub Issues)
- Code examples or patterns (self-documenting in codebase)
- Personal project notes (ephemeral)

**Keep it under 100 lines total.**
