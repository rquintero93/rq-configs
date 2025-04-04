# Layout for eeAPITest
session_root "/Users/ricardoquintero/Documents/Global Alumni/eeAPITest"

if initialize_session "eeAPITest"; then
  load_window "nvim"
  load_window "shell"
  select_window 1
fi

finalize_and_go_to_session
