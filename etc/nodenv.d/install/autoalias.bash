after_install autoalias

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
      *[0-9]-*)
        nodenv alias "$(echo "$VERSION_NAME"|sed -e 's/-.*$//')" --auto 2>/dev/null || true
        ;;
    esac
  fi
}
