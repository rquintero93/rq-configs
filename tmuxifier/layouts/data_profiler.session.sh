# Layout for data_profiler
session_root "/Users/ricardoquintero/Documents/Global Alumni/data_profiler"

if initialize_session "data_profiler"; then
  load_window "nvim"
  load_window "shell"
  select_window 1
fi

finalize_and_go_to_session
