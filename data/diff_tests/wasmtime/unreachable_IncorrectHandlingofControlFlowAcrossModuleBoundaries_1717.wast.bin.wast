(assert_invalid
  (module binary
    "\00\61\73\6d\01\00\00\00\01\84\80\80\80\00\01\60"
    "\00\00\02\90\80\80\80\00\01\07\6d\6f\64\75\6c\65"
    "\42\04\66\75\6e\63\00\00\03\82\80\80\80\00\01\00"
    "\0a\a1\80\80\80\00\01\9b\80\80\80\00\00\02\40\41"
    "\00\42\01\43\00\00\00\40\44\00\00\00\00\00\00\08"
    "\40\1a\10\00\00\0b\0b"
  )
""
)