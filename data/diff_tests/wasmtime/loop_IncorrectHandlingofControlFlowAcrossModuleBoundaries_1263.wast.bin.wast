(assert_invalid
  (module binary
    "\00\61\73\6d\01\00\00\00\01\88\80\80\80\00\02\60"
    "\00\00\60\00\01\7f\02\91\80\80\80\00\01\07\6d\6f"
    "\64\75\6c\65\42\05\66\75\6e\63\42\00\00\03\82\80"
    "\80\80\00\01\01\07\89\80\80\80\00\01\05\66\75\6e"
    "\63\41\00\01\0a\8f\80\80\80\00\01\89\80\80\80\00"
    "\00\03\7f\10\00\0c\00\0b\0b"
  )
""
)