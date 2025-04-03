# Layout for DataLakePipeline
session_root "/Users/ricardoquintero/Documents/Global Alumni/DataLakePipeline"

if initialize_session "DataLakePipeline"; then
  load_window "nvim"
  load_window "shell"
  select_window 1
fi

finalize_and_go_to_session
