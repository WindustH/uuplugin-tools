#!/bin/zsh

# ==========================================
# UU Plugin Shared Constants
# ==========================================

# --- 基础目录 ---
# 如果 BASEDIR 未定义，则使用常量文件所在目录
if [ -z "${BASEDIR:-}" ]; then
    readonly BASEDIR="$(cd "$(dirname "${(%):-%x}")" && pwd)"
fi
readonly RUNNING_DIR="${BASEDIR}/uu"
readonly PLUGIN_DIR="${BASEDIR}"

# --- 文件名称 ---
readonly PLUGIN_TAR="uu.tar.gz"
readonly PLUGIN_EXE="uuplugin"
readonly PLUGIN_CONF="uu.conf"
readonly PLUGIN_TAR_MD5_FILE="${PLUGIN_DIR}/uu.tar.gz.md5"

# --- PID 文件 ---
readonly DAEMON_PID_FILE="/var/run/uuplugind.pid"
readonly PLUGIN_PID_FILE="/var/run/uuplugin.pid"

# --- 日志文件 ---
readonly CTL_LOG_FILE="/tmp/uupluginctl.log"
readonly DAEMON_LOG_FILE="/tmp/uuplugind.log"

# --- 脚本文件 ---
readonly DAEMON_SCRIPT="${BASEDIR}/uuplugind"

# --- uupluginctl 特定的常量 ---
readonly URL_PREFIX="https://"
readonly DOWNLOAD_URL="router.uu.163.com/api/plugin?type="
readonly STEAM_DECK_PLUGIN="steam-deck-plugin"
readonly MODEL="x86_64"

# --- 颜色定义 (用于 uupluginctl) ---
readonly RED='\033[0;31m'
readonly GREEN='\033[0;32m'
readonly YELLOW='\033[1;33m'
readonly BLUE='\033[0;34m'
readonly NC='\033[0m'