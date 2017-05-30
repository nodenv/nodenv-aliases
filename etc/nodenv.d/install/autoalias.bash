recommended_aliases() {
  local name="$1"
  {
    echo "${name%%.*}" # major
    echo "${name%.*.*}" # major.minor for pre-releases
    echo "${name%.*}" # major.minor for non-pre-releases
  } | sort -u | grep -xv 0
}

autoalias() {
  if [ "$STATUS" = 0 ]; then
    case "$VERSION_NAME" in
      *.*.*)
        for v in $(recommended_aliases "$VERSION_NAME"); do
          nodenv-alias "$v" --auto 2>/dev/null || true
        done ;;
    esac
  fi
}

after_install autoalias
