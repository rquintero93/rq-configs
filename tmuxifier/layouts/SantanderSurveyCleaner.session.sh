# Layout for SantanderSurveyCleaner
session_root "/Users/ricardoquintero/Documents/Global Alumni/SantanderSurveyCleaner"

if initialize_session "SantanderSurveyCleaner"; then
  load_window "nvim"
  load_window "shell"
  select_window 1
fi

finalize_and_go_to_session
