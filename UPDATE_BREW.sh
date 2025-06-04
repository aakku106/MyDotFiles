#!/bin/bash

LOG_FILE="$HOME/brew_update_log.txt"
{
  echo "🕒 Brew Update Log - $(date)"
  echo "------------------------------"

  echo "📦 Checking for outdated packages..."
  brew outdated

  echo "🔄 Updating Homebrew..."
  brew update

  echo "🚀 Upgrading all packages and apps..."
  brew upgrade

  echo "🧹 Cleaning up old versions..."
  brew cleanup

  echo "🩺 Running system health check (brew doctor)..."
  brew doctor

  echo "✅ All done! You're all fresh and up to date, Aakku 💻🔥"
} > "$LOG_FILE" 2>&1
