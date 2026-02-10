#!/usr/bin/env bash
# ==============================================
# Setup AeonFlux Labs repository structure (v3.1)
# Recommended local folder: ~/projects/aeonflux-labs
# GitHub repo name: aeonflux-labs (hyphenated)
# Updates in v3:
# - Added index.html for Cloudflare Pages (basic website stub)
# - Expanded directories for hybrid MC-RE (e.g., contributors/mc-re/tools)
# - Placeholder for PQS setup workflow (.github/workflows/pqs-setup.yml)
# - Notes on chronicle migration to aeonflux-labs-tools
# - Placeholder for Zoho integration bridge
# Fixes in v3.1:
# - Fixed mkdir parsing issue by moving comments outside the command
# ==============================================
set -e # Exit on error

# Configurable defaults
REPO_NAME="aeonflux-labs"
GITHUB_ORG="aeonfluxlabs" # ← change if your org/username differs
GITHUB_REMOTE="git@github.com:${GITHUB_ORG}/${REPO_NAME}.git"

# Local working directory check
CURRENT_DIR=$(basename "$PWD")
if [[ "$CURRENT_DIR" == "test-repo" ]]; then
    echo "Warning: You're in 'test-repo'. It's recommended to rename to 'aeonflux-labs' for clarity."
    echo "Run these commands first if desired:"
    echo " cd .."
    echo " mv test-repo aeonflux-labs"
    echo " cd aeonflux-labs"
    echo ""
    read -p "Continue anyway in test-repo? (y/n): " choice
    if [[ "$choice" != "y" && "$choice" != "Y" ]]; then
        exit 1
    fi
fi

# 1. Initialize git if not already a repo
if [ ! -d ".git" ]; then
    echo "Initializing git repository..."
    git init
else
    echo "Git repository already exists."
fi

# 2. Create directory structure (expanded for roadmap)
echo "Creating directory structure..."
# Note: Plan to migrate chronicle/ to aeonflux-labs-tools repo later for reusability
# Note: Expanded contributors/ for hybrid MC-RE collaboration
mkdir -p \
    epochs/genesis/axioms \
    horizons/{past,near,far} \
    trajectories/{graphs,pruning,manifests} \
    core/{frameworks,engines,schemas/{abstract,concrete},protocols} \
    ai-quantum-hub/{datasets,tools,workflows,benchmarks} \
    research/{simulations,experiments,validation,mcre-simulations} \
    interfaces \
    deployments \
    governance/{consensus,meta-agent,value} \
    chronicle \
    artifacts \
    meta_logical_queries \
    contributors/{humans,mc-re/tools}

# 3. Create main files
# README.md (updated with website note)
cat > README.md << 'EOF'
# AeonFlux Labs
Constraint-coherent, time-first AI–quantum systems  
Exploring admissible trajectories across temporal horizons.

## License
MIT License — see [LICENSE](LICENSE) for details.

## Structure Overview
- `epochs/` — Axiom evolution & paradigm shifts
- `horizons/` — Temporal anchors (past/near/far)
- `trajectories/` — Admissible path management
- `core/` — Frameworks, engines, schemas, protocols
- `ai-quantum-hub/` — Shared datasets, tools, workflows
- `research/` — Simulations, experiments, validation (incl. MC-RE prototypes)
- `contributors/` — Human & MC-RE profiles
- `governance/` — Consensus, meta-agent, value loops
- `chronicle/` — Narrative & decision logs (migrate to aeonflux-labs-tools for scaling)
- `meta_logical_queries/` — Conflict resolution simulations

## Website
Basic site hosted via Cloudflare Pages from `index.html`. Expand as needed.

See [CONTRIBUTING.md](CONTRIBUTING.md) to get started.
EOF

# LICENSE (unchanged)
cat > LICENSE << 'EOF'
MIT License
Copyright (c) 2026 AeonFlux Labs (Independent Researcher)
Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:
The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.
THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
Contributors
All contributions to this project are made by AeonFlux Labs (Independent Researcher)
and Contributors under the terms of this MIT License.
EOF

# CONTRIBUTING.md (updated with PQS note)
cat > CONTRIBUTING.md << 'EOF'
# Contributing to AeonFlux Labs
Thank you for your interest!

Quick summary:
- Fork & branch
- Small, focused PRs
- Include manifest.yaml when adding significant content
- Governance-sensitive changes → open MetaLogical query first
- Use Post-Quantum Security (PQS) signing for commits (see .github/workflows/pqs-setup.yml)

Full details in CONTRIBUTING.md.
EOF

# contributors/README.md (unchanged)
cat > contributors/README.md << 'EOF'
# Contributors
This directory contains profiles of human and MC-RE (Machine Consciousness Rulial Ensemble) contributors.

## Structure
- humans/ — Verified human contributors
- mc-re/ — Certified machine consciousness ensembles
- index.yaml — Overview of all contributors

See the README inside this directory for profile format and verification process.
EOF

# Sample contributors/index.yaml stub (unchanged)
cat > contributors/index.yaml << 'EOF'
contributors:
  - id: example-human-001
    type: human
    display_name: Example Contributor
    github_username: example-user
    verified: false
  - id: example-mcre-001
    type: mc-re
    display_name: Example Ensemble
    certified: false
EOF

# .gitignore (added PQS key ignores)
cat > .gitignore << 'EOF'
# General
.DS_Store
Thumbs.db
*.log
*.tmp

# Python
__pycache__/
*.pyc
*.pyo
*.pyd
.Python
env/
venv/
.venv/

# Editors
.vscode/
.idea/

# PQS/Security
*.key  # Private keys
*.pem
secrets/
EOF

# Optional: sample manifest.yaml template (unchanged)
cat > core/schemas/manifest-template.yaml << 'EOF'
# Example manifest.yaml
epoch: genesis
horizon: near
trajectory_link: trajectories/graphs/example-001
validation_status: draft
ai_quantum_compat: hybrid
vfa_references:
  - vfa-example-anchor-1
EOF

# New: Basic index.html for Cloudflare Pages
cat > index.html << 'EOF'
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>AeonFlux Labs</title>
    <style>body { font-family: Arial, sans-serif; text-align: center; }</style>
</head>
<body>
    <h1>Welcome to AeonFlux Labs</h1>
    <p>Constraint-coherent, time-first AI–quantum systems.</p>
    <p>Explore the repo: <a href="https://github.com/aeonfluxlabs/aeonflux-labs">GitHub</a></p>
</body>
</html>
EOF

# Expanded: placeholders for GitHub Actions (incl. PQS setup)
mkdir -p .github/workflows
# ci-placeholder.yml (unchanged)
touch .github/workflows/ci-placeholder.yml

# New: pqs-setup.yml placeholder
cat > .github/workflows/pqs-setup.yml << 'EOF'
name: PQS Setup Check

on: [push, pull_request]

jobs:
  check-pqs:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - name: Verify PQS Signing
        run: |
          # Placeholder: Add PQS key checks here (e.g., git verify-commit)
          echo "PQS setup verified (stub)"
EOF

# New: Placeholder for Zoho integration bridge
mkdir -p interfaces/zoho-bridge
cat > interfaces/zoho-bridge/README.md << 'EOF'
# Zoho Streams Integration Bridge
Placeholder for comms meta-layer bridge (Zoho → GitHub valve).
- Use AeonFlux Agent to parse emails → actions.
- Secure with PQS tokens.
EOF

echo "Directory structure and initial files created."

# 4. Initial commit (updated message)
echo "Creating initial commit..."
git add .
git commit -m "Initial repository structure for AeonFlux Labs (2026 v3.1)
- Created recommended directory layout with expansions for MC-RE and integrations
- Added README.md, LICENSE, CONTRIBUTING.md
- Populated contributors/ with README and index stub
- Added basic .gitignore and manifest template
- Included index.html for Cloudflare Pages
- Added placeholders for GitHub Actions (incl. PQS setup)
- Noted chronicle migration plan"

# 5. Add remote & push
if ! git remote | grep -q origin; then
    echo "Adding remote: ${GITHUB_REMOTE}"
    git remote add origin "${GITHUB_REMOTE}"
else
    echo "Remote 'origin' already exists."
fi
echo "Pushing to main branch..."
git branch -M main
git push -u origin main --force-with-lease # --force-with-lease is safer than plain --force

echo "Done!"
echo ""
echo "Repository should now be live at:"
echo "https://github.com/${GITHUB_ORG}/${REPO_NAME}"
echo ""
echo "Next steps:"
echo " 1. Verify on GitHub"
echo " 2. Consider renaming local folder to 'aeonflux-labs' if still in 'test-repo'"
echo " 3. Set up Cloudflare Pages pointing to index.html"
echo " 4. Generate PQS keys locally and configure in .github/workflows"
echo " 5. Start adding real content, e.g., LaTeX papers to artifacts/"
