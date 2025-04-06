# Layout for config-repo
session_root "/Users/ricardoquintero/config-repo"

if initialize_session "config-repo"; then
  load_window "nvim"
  load_window "shell"
  select_window 1
fi

finalize_and_go_to_session
