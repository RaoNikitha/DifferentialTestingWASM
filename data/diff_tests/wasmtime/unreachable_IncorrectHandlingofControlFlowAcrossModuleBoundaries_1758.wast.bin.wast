(assert_invalid
  (module binary
    "\00\61\73\6d\01\00\00\00\01\85\80\80\80\00\01\60"
    "\00\01\7f\02\91\80\80\80\00\01\07\6d\6f\64\75\6c"
    "\65\43\05\66\75\6e\63\43\00\00\03\82\80\80\80\00"
    "\01\00\07\89\80\80\80\00\01\05\66\75\6e\63\42\00"
    "\01\0a\8b\80\80\80\00\01\85\80\80\80\00\00\10\00"
    "\00\0b"
  )
""
)