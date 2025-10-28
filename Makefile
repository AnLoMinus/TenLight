# TenLight - Makefile
# Development and build automation for TenLight project

.PHONY: help install build test lint clean dev deploy docs

# Default target
help: ## Show this help message
	@echo "TenLight - Development Commands"
	@echo "=============================="
	@echo ""
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'

# Installation
install: ## Install all dependencies
	@echo "Installing dependencies..."
	npm install
	pip install -r requirements.txt
	@echo "✅ Dependencies installed successfully!"

# Development
dev: ## Start development server
	@echo "Starting development server..."
	npm run dev

dev-watch: ## Start development server with watch mode
	@echo "Starting development server with watch mode..."
	npm run dev:watch

# Building
build: ## Build the project
	@echo "Building project..."
	npm run build
	python scripts/build.py
	@echo "✅ Build completed successfully!"

build-prod: ## Build for production
	@echo "Building for production..."
	npm run build:prod
	python scripts/build.py --prod
	@echo "✅ Production build completed successfully!"

# Testing
test: ## Run all tests
	@echo "Running tests..."
	npm test
	python scripts/test.py
	@echo "✅ Tests completed successfully!"

test-unit: ## Run unit tests
	@echo "Running unit tests..."
	npm run test:unit
	python scripts/test.py --unit
	@echo "✅ Unit tests completed successfully!"

test-integration: ## Run integration tests
	@echo "Running integration tests..."
	npm run test:integration
	python scripts/test.py --integration
	@echo "✅ Integration tests completed successfully!"

test-e2e: ## Run end-to-end tests
	@echo "Running E2E tests..."
	npm run test:e2e
	python scripts/test.py --e2e
	@echo "✅ E2E tests completed successfully!"

# Linting and formatting
lint: ## Run linting
	@echo "Running linting..."
	npm run lint
	python scripts/lint.py
	@echo "✅ Linting completed successfully!"

format: ## Format code
	@echo "Formatting code..."
	npm run format
	python scripts/format.py
	@echo "✅ Code formatting completed successfully!"

# Cleaning
clean: ## Clean build artifacts
	@echo "Cleaning build artifacts..."
	rm -rf build/
	rm -rf dist/
	rm -rf out/
	rm -rf coverage/
	rm -rf .nyc_output/
	rm -rf node_modules/
	find . -type d -name "__pycache__" -exec rm -rf {} +
	find . -type f -name "*.pyc" -delete
	find . -name "*.tmp" -delete
	find . -name "*.temp" -delete
	@echo "✅ Cleanup completed successfully!"

# Documentation
docs: ## Generate documentation
	@echo "Generating documentation..."
	npm run docs
	python scripts/docs.py
	@echo "✅ Documentation generated successfully!"

docs-serve: ## Serve documentation locally
	@echo "Serving documentation..."
	npm run docs:serve
	python scripts/docs.py --serve

# Deployment
deploy-staging: ## Deploy to staging
	@echo "Deploying to staging..."
	npm run deploy:staging
	python scripts/deploy.py --env staging
	@echo "✅ Staging deployment completed successfully!"

deploy-prod: ## Deploy to production
	@echo "Deploying to production..."
	npm run deploy:prod
	python scripts/deploy.py --env production
	@echo "✅ Production deployment completed successfully!"

# Security
security-scan: ## Run security scans
	@echo "Running security scans..."
	npm run security:scan
	python scripts/security.py
	@echo "✅ Security scans completed successfully!"

# Performance
perf-test: ## Run performance tests
	@echo "Running performance tests..."
	npm run perf:test
	python scripts/perf.py
	@echo "✅ Performance tests completed successfully!"

# Database
db-migrate: ## Run database migrations
	@echo "Running database migrations..."
	python scripts/db.py migrate
	@echo "✅ Database migrations completed successfully!"

db-seed: ## Seed database with test data
	@echo "Seeding database..."
	python scripts/db.py seed
	@echo "✅ Database seeding completed successfully!"

# Docker
docker-build: ## Build Docker image
	@echo "Building Docker image..."
	docker build -t tenlight:latest .
	@echo "✅ Docker image built successfully!"

docker-run: ## Run Docker container
	@echo "Running Docker container..."
	docker run -p 3000:3000 tenlight:latest

docker-compose-up: ## Start Docker Compose services
	@echo "Starting Docker Compose services..."
	docker-compose up -d
	@echo "✅ Docker Compose services started successfully!"

docker-compose-down: ## Stop Docker Compose services
	@echo "Stopping Docker Compose services..."
	docker-compose down
	@echo "✅ Docker Compose services stopped successfully!"

# Release
release: ## Create a new release
	@echo "Creating new release..."
	npm run release
	python scripts/release.py
	@echo "✅ Release created successfully!"

# Backup
backup: ## Create backup
	@echo "Creating backup..."
	python scripts/backup.py
	@echo "✅ Backup created successfully!"

# Restore
restore: ## Restore from backup
	@echo "Restoring from backup..."
	python scripts/restore.py
	@echo "✅ Restore completed successfully!"

# Monitoring
monitor: ## Start monitoring
	@echo "Starting monitoring..."
	npm run monitor
	python scripts/monitor.py
	@echo "✅ Monitoring started successfully!"

# Logs
logs: ## View logs
	@echo "Viewing logs..."
	tail -f logs/app.log

# Status
status: ## Show project status
	@echo "Project Status"
	@echo "=============="
	@echo "Node.js version: $(shell node --version)"
	@echo "NPM version: $(shell npm --version)"
	@echo "Python version: $(shell python --version)"
	@echo "Git version: $(shell git --version)"
	@echo "Docker version: $(shell docker --version)"
	@echo ""
	@echo "Project files:"
	@echo "README.md: $(shell test -f README.md && echo '✅' || echo '❌')"
	@echo "LICENSE: $(shell test -f LICENSE && echo '✅' || echo '❌')"
	@echo "package.json: $(shell test -f package.json && echo '✅' || echo '❌')"
	@echo "requirements.txt: $(shell test -f requirements.txt && echo '✅' || echo '❌')"
	@echo ""
	@echo "Dependencies:"
	@echo "node_modules: $(shell test -d node_modules && echo '✅' || echo '❌')"
	@echo "Python packages: $(shell pip list | grep -q tenlight && echo '✅' || echo '❌')"

# All-in-one commands
setup: install build test ## Complete setup (install, build, test)
ci: test lint security-scan ## CI pipeline (test, lint, security)
deploy: build test deploy-prod ## Complete deployment
release-full: test lint security-scan release ## Full release process

# TenLight specific commands
spiritual-research: ## Start spiritual research tools
	@echo "Starting spiritual research tools..."
	python scripts/spiritual_research.py
	@echo "✅ Spiritual research tools started successfully!"

kabbalah-study: ## Start Kabbalah study tools
	@echo "Starting Kabbalah study tools..."
	python scripts/kabbalah_study.py
	@echo "✅ Kabbalah study tools started successfully!"

torah-analysis: ## Start Torah analysis tools
	@echo "Starting Torah analysis tools..."
	python scripts/torah_analysis.py
	@echo "✅ Torah analysis tools started successfully!"

commandments-search: ## Search commandments
	@echo "Searching commandments..."
	python scripts/commandments_search.py
	@echo "✅ Commandments search completed successfully!"

sefirot-visualization: ## Generate Sefirot visualization
	@echo "Generating Sefirot visualization..."
	python scripts/sefirot_visualization.py
	@echo "✅ Sefirot visualization generated successfully!"

# Help for specific commands
help-install: ## Show help for installation
	@echo "Installation Commands:"
	@echo "  make install     - Install all dependencies"
	@echo "  make setup       - Complete setup (install, build, test)"

help-dev: ## Show help for development
	@echo "Development Commands:"
	@echo "  make dev         - Start development server"
	@echo "  make dev-watch   - Start development server with watch mode"
	@echo "  make build       - Build the project"
	@echo "  make test        - Run all tests"

help-deploy: ## Show help for deployment
	@echo "Deployment Commands:"
	@echo "  make deploy-staging - Deploy to staging"
	@echo "  make deploy-prod    - Deploy to production"
	@echo "  make deploy         - Complete deployment"

help-tenlight: ## Show help for TenLight specific commands
	@echo "TenLight Specific Commands:"
	@echo "  make spiritual-research    - Start spiritual research tools"
	@echo "  make kabbalah-study        - Start Kabbalah study tools"
	@echo "  make torah-analysis       - Start Torah analysis tools"
	@echo "  make commandments-search  - Search commandments"
	@echo "  make sefirot-visualization - Generate Sefirot visualization"
