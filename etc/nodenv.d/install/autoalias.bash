after_install autoalias

strip_patch() {
  sed -E -e 's/\.[0-9]+$//'
}

autoalias() {
  if [ "$STATUS" = 0 ]; then
    case "$VERSION_NAME" in
      *[0-9]-*-*)
        local patch="$(echo $VERSION_NAME|sed -e 's/-[^-]*$//')"
        if [ ! -e "$NODENV_ROOT/$patch" ]; then
          # nodenv alias 1.9.3-p194 1.9.3-p194-perf
          nodenv alias "$patch" "$VERSION_NAME"
        fi
        ;;
    esac
    case "$VERSION_NAME" in
      *.*.*)
        nodenv alias "$(echo "$VERSION_NAME" | strip_patch)" --auto 2>/dev/null || true
        ;;
    esac
  fi
}
