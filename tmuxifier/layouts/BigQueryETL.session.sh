# Layout for BigQueryETL
session_root "/Users/ricardoquintero/Documents/Global Alumni/BigQueryETL"

if initialize_session "BigQueryETL"; then
  load_window "nvim"
  load_window "shell"
  select_window 1
fi

finalize_and_go_to_session
