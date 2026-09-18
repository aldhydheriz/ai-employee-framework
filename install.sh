#!/usr/bin/env bash
# AI Employee Framework Installer
# Usage:
#   curl -fsSL https://raw.githubusercontent.com/aldhydheriz/ai-employee-framework/main/install.sh | bash
#   OR: ./install.sh [target_directory]

set -e

TARGET_DIR="${1:-.}"
REPO_RAW="https://raw.githubusercontent.com/aldhydheriz/ai-employee-framework/main"

echo "==> Installing AI Employee Framework to: $TARGET_DIR"

# Ensure target directory exists
mkdir -p "$TARGET_DIR/.agents/rules"
mkdir -p "$TARGET_DIR/.agents/skills/persona/references"

# Detect whether running from local cloned repo or remote curl
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" 2>/dev/null && pwd || echo "")"
IS_LOCAL=false

if [ -n "$SCRIPT_DIR" ] && [ -f "$SCRIPT_DIR/rules/ai-employee.md" ]; then
  IS_LOCAL=true
fi

# Function to download or copy file
install_file() {
  local src_rel="$1"
  local dest="$2"

  if [ "$IS_LOCAL" = true ]; then
    cp "$SCRIPT_DIR/$src_rel" "$dest"
  else
    curl -fsSL "$REPO_RAW/$src_rel" -o "$dest"
  fi
}

# 1. Install AGENTS.md at root
if [ -f "$TARGET_DIR/AGENTS.md" ]; then
  if grep -q "AI Employee Behavioral Framework" "$TARGET_DIR/AGENTS.md"; then
    echo "    [INFO] AGENTS.md already contains AI Employee Framework. Updating rules..."
    install_file "rules/ai-employee.md" "$TARGET_DIR/.agents/rules/ai-employee.md"
  else
    echo "    [WARN] Existing AGENTS.md detected. Appending AI Employee Framework..."
    echo -e "\n\n" >> "$TARGET_DIR/AGENTS.md"
    if [ "$IS_LOCAL" = true ]; then
      cat "$SCRIPT_DIR/rules/ai-employee.md" >> "$TARGET_DIR/AGENTS.md"
    else
      curl -fsSL "$REPO_RAW/rules/ai-employee.md" >> "$TARGET_DIR/AGENTS.md"
    fi
  fi
else
  echo "    [+] Creating AGENTS.md at project root..."
  install_file "rules/ai-employee.md" "$TARGET_DIR/AGENTS.md"
fi

# 2. Install archive rule in .agents/rules/
install_file "rules/ai-employee.md" "$TARGET_DIR/.agents/rules/ai-employee.md"

# 3. Install persona skills
echo "    [+] Installing domain personas (Tech Lead, Product Partner, Developer, etc.)..."
install_file "skills/persona/SKILL.md" "$TARGET_DIR/.agents/skills/persona/SKILL.md"

PERSONAS=(
  "tech-lead.md"
  "product-partner.md"
  "developer.md"
  "marketer.md"
  "content-writer.md"
  "data-analyst.md"
  "designer.md"
)

for p in "${PERSONAS[@]}"; do
  install_file "skills/persona/references/$p" "$TARGET_DIR/.agents/skills/persona/references/$p"
done

echo ""
echo "==> [OK] AI Employee Framework successfully installed."
echo "    - Root Rule:    $TARGET_DIR/AGENTS.md"
echo "    - Rules Dir:    $TARGET_DIR/.agents/rules/ai-employee.md"
echo "    - Personas:     $TARGET_DIR/.agents/skills/persona/"
echo ""
echo "Stage-Awareness, Sparring Partner, and Scope Slicing are now active."
