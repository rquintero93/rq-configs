# Layout for excel_datalink
session_root "/Users/ricardoquintero/Documents/Global Alumni/excel_datalink"

if initialize_session "excel_datalink"; then
  load_window "nvim"
  load_window "shell"
  select_window 1
fi

finalize_and_go_to_session
