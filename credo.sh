#!/bin/bash
#
# Linter Elixir files using Credo.
# Called by "git receive-pack" with arguments: refname sha1-old sha1-new
#
# Config
# ------
# credo.terminate
#   The credo exit status level to be considered as “not passed”—to prevent
#   git commit until fixed.

# Config
terminate_on=$(git config --int credo.terminate)
if [[ -z $terminate_on ]]; then terminate_on=16; fi

# lint it :: credo checks before commit
mix credo
CREDO_RES=$?
if [ $CREDO_RES -ge $terminate_on ]; then
  echo ""
  echo "☆ ============================================= ☆"
  echo "☆ Credo found critical problems with your code  ☆" >&2
  echo "☆   and commit can not proceed. Please examine  ☆" >&2
  echo "☆   log above and fix issues before committing. ☆" >&2
  echo "☆ ============================================= ☆"
  echo ""
  exit $CREDO_RES
fi
if [ $CREDO_RES -le 9 ]; then CREDO_RES=" $CREDO_RES"; fi
echo ""
echo "★ ============================== ★"
echo "★   Credo passed successfully.   ★"
echo "★   Exit value is: (total: $CREDO_RES).  ★"
echo "★ ============================== ★"
echo ""

# Finished
exit 0
