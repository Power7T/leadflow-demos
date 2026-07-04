#!/bin/bash
# LeadFlow Demos - Cloudflare Pages Deploy Script
# Saves you from exposing your GitHub account details.

# Load credentials from home directory (completely out of Git's scope)
CRED_FILE="$HOME/.cf_credentials"
if [ ! -f "$CRED_FILE" ]; then
  echo "Error: $CRED_FILE not found."
  echo "Please ensure it contains your CLOUDFLARE_API_TOKEN and CLOUDFLARE_ACCOUNT_ID."
  exit 1
fi

source "$CRED_FILE"
export CLOUDFLARE_API_TOKEN CLOUDFLARE_ACCOUNT_ID

echo "🚀 Syncing and deploying static assets to Cloudflare Pages..."
npx wrangler pages deploy "$HOME/leadflow/demos" --project-name=leadflow-demos

echo "✨ Deployment complete!"
