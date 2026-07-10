#!/usr/bin/env bash
# Build two permission-scoped views of the Team OS for the scoped-views demo beat.
# Same kernel, two roles. In production an MCP gateway serves these as virtual
# endpoints mapped to IdP groups — this script fakes that with two folders so the
# demo needs zero infrastructure.
set -euo pipefail
cd "$(dirname "$0")/.."

rm -rf demo-views

# EXEC view — strategy: all metrics, processes, ownership, glossary, definitions. No runbooks.
mkdir -p demo-views/exec
cp bundle/index.md bundle/log.md demo-views/exec/
cp -R bundle/metrics bundle/processes bundle/ownership bundle/glossary bundle/definitions demo-views/exec/
cp -R synthetic-data demo-views/exec/

# SUPPORT view — operations: runbooks, triage metrics only (no commercial metrics),
# consent process, glossary, ownership. No MACU / payment-conversion / client onboarding.
mkdir -p demo-views/support/metrics demo-views/support/processes
cp bundle/index.md bundle/log.md demo-views/support/
cp -R bundle/runbooks bundle/glossary bundle/ownership demo-views/support/
cp bundle/metrics/connection-success-rate.md bundle/metrics/reauth-completion-rate.md demo-views/support/metrics/
cp bundle/processes/consent-lifecycle.md demo-views/support/processes/
cp -R bundle/definitions demo-views/support/
cp -R synthetic-data demo-views/support/

echo "Built demo-views/exec and demo-views/support."
echo "Try asking both: 'What is our monthly active connected users number?'"
echo "  exec view answers; support view says it isn't in its OS — same kernel, scoped views."
