#!/bin/bash

# Get the absolute path of the current directory (where this script is run from's parent)
# We assume this script is in /scripts/, so we go back one level to get the root.
PROJECT_ROOT="$(cd "$(dirname "$0")/.." && pwd)"
INBOX_FILE="$PROJECT_ROOT/drafts/learning_inbox.md"

# The alias command we want to add
ALIAS_CMD="alias mark='pbpaste | sed \"s/^/> /\" >> \"$INBOX_FILE\" && echo \"\n---\n\" >> \"$INBOX_FILE\" && echo \"✅ Learing saved to inbox!\"'"

# Check if .zshrc exists, if not create it
TOUCH ~/.zshrc

# Check if the alias is already there (simple check)
if grep -q "alias mark=" ~/.zshrc; then
    echo "⚠️  The 'mark' alias already exists in your .zshrc."
    echo "Please remove it manually if you want to update it."
else
    echo "" >> ~/.zshrc
    echo "# Added by AI Collaboration Guide" >> ~/.zshrc
    echo "$ALIAS_CMD" >> ~/.zshrc
    echo "✅ 'mark' command added to .zshrc"
    echo "👉 Run 'source ~/.zshrc' or open a new terminal to start using it."
fi
