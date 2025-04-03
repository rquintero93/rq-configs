# Layout for Conciliacion Paypal
session_root "/Users/ricardoquintero/Documents/Global Alumni/Conciliacion Paypal"

if initialize_session "Conciliacion Paypal"; then
  load_window "nvim"
  load_window "shell"
  select_window 1
fi

finalize_and_go_to_session
