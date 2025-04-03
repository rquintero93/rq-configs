# Layout for nvim
session_root "/Users/ricardoquintero/.config/nvim"

if initialize_session "nvim"; then
  load_window "nvim"
  load_window "shell"
  select_window 1
fi

finalize_and_go_to_session
