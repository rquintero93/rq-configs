# Layout for santander-metrics
session_root "/Users/ricardoquintero/Documents/Global Alumni/santander-metrics"

if initialize_session "santander-metrics"; then
  load_window "nvim"
  load_window "shell"
  select_window 1
fi

finalize_and_go_to_session
