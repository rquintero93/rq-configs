# Layout for nerdBot
session_root "/Users/ricardoquintero/Documents/DeSciWorld/nerdBot"

if initialize_session "nerdBot"; then
  load_window "nvim"
  load_window "shell"
  select_window 1
fi

finalize_and_go_to_session
