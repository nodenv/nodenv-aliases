after_uninstall autoalias

autoalias() {
  case "$VERSION_NAME" in
  *.*.*)
    nodenv alias "${VERSION_NAME%.*}" --auto 2>/dev/null || true
    ;;
  esac
}
