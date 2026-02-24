#!/usr/bin/env bash
# DataBridge dependency checker
# Usage: bash check-deps.sh

set -euo pipefail

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

echo "DataBridge Dependency Check"
echo "═══════════════════════════"
echo ""

# Check Python version
echo -n "Python 3.10+: "
if command -v python3 &> /dev/null; then
    PY_CMD="python3"
elif command -v python &> /dev/null; then
    PY_CMD="python"
else
    echo -e "${RED}NOT FOUND${NC}"
    echo "  Install Python 3.10+ from https://python.org"
    exit 1
fi

PY_VERSION=$($PY_CMD -c "import sys; print(f'{sys.version_info.major}.{sys.version_info.minor}')")
PY_MAJOR=$($PY_CMD -c "import sys; print(sys.version_info.major)")
PY_MINOR=$($PY_CMD -c "import sys; print(sys.version_info.minor)")

if [ "$PY_MAJOR" -ge 3 ] && [ "$PY_MINOR" -ge 10 ]; then
    echo -e "${GREEN}$PY_VERSION ✓${NC}"
else
    echo -e "${RED}$PY_VERSION ✗ (need 3.10+)${NC}"
fi

echo ""
echo "Required packages:"

# Check required packages
REQUIRED=("pandas" "pydantic" "fastmcp")
MISSING_REQ=()
for pkg in "${REQUIRED[@]}"; do
    echo -n "  $pkg: "
    if $PY_CMD -c "import $pkg" 2>/dev/null; then
        VERSION=$($PY_CMD -c "import $pkg; print(getattr($pkg, '__version__', 'installed'))")
        echo -e "${GREEN}$VERSION ✓${NC}"
    else
        echo -e "${RED}NOT INSTALLED ✗${NC}"
        MISSING_REQ+=("$pkg")
    fi
done

echo ""
echo "Optional packages:"

# Check optional packages
declare -A OPTIONAL=(
    ["openpyxl"]="Excel file support"
    ["rapidfuzz"]="Fuzzy matching"
    ["sqlalchemy"]="SQL database support"
    ["pdfplumber"]="PDF text extraction"
)

MISSING_OPT=()
for pkg in "${!OPTIONAL[@]}"; do
    echo -n "  $pkg (${OPTIONAL[$pkg]}): "
    if $PY_CMD -c "import $pkg" 2>/dev/null; then
        VERSION=$($PY_CMD -c "import $pkg; print(getattr($pkg, '__version__', 'installed'))")
        echo -e "${GREEN}$VERSION ✓${NC}"
    else
        echo -e "${YELLOW}not installed${NC}"
        MISSING_OPT+=("$pkg")
    fi
done

# Snowflake connector has a different import name
echo -n "  snowflake-connector-python (Snowflake): "
if $PY_CMD -c "import snowflake.connector" 2>/dev/null; then
    echo -e "${GREEN}installed ✓${NC}"
else
    echo -e "${YELLOW}not installed${NC}"
    MISSING_OPT+=("snowflake-connector-python")
fi

echo ""
echo "═══════════════════════════"

if [ ${#MISSING_REQ[@]} -gt 0 ]; then
    echo -e "${RED}Missing required packages:${NC}"
    echo "  pip install ${MISSING_REQ[*]}"
    echo ""
fi

if [ ${#MISSING_OPT[@]} -gt 0 ]; then
    echo -e "${YELLOW}Missing optional packages:${NC}"
    echo "  pip install ${MISSING_OPT[*]}"
    echo ""
    echo "Or install all optional deps:"
    echo "  pip install 'databridge-core[all]'"
fi

if [ ${#MISSING_REQ[@]} -eq 0 ]; then
    echo -e "${GREEN}All required dependencies are installed.${NC}"
fi
