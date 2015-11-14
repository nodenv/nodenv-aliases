after_install autoalias

autoalias() {
  if [ "$STATUS" = 0 ]; then
    # this isn't currently used by nodenv
    case "$VERSION_NAME" in
      *[0-9]-*-*)
        local patch="${VERSION_NAME%-*}"
        if [ ! -e "$NODENV_ROOT/$patch" ]; then
          # nodenv alias 1.9.3-p194 1.9.3-p194-perf
          nodenv alias "$patch" "$VERSION_NAME"
        fi
        ;;
    esac
    case "$VERSION_NAME" in
      *.*.*)
        nodenv alias "${VERSION_NAME%.*}" --auto 2>/dev/null || true
        ;;
    esac
  fi
}
