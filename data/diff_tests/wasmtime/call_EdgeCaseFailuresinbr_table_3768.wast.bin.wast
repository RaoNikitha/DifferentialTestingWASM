(assert_invalid
  (module binary
    "\00\61\73\6d\01\00\00\00\01\88\80\80\80\00\02\60"
    "\00\00\60\00\01\7f\03\84\80\80\80\00\03\01\00\00"
    "\04\84\80\80\80\00\01\70\00\0a\07\88\80\80\80\00"
    "\01\04\74\65\73\74\00\01\08\81\80\80\80\00\02\09"
    "\90\80\80\80\00\01\00\41\00\0b\0a\00\00\00\00\00"
    "\00\00\00\00\00\0a\a1\80\80\80\00\03\86\80\80\80"
    "\00\00\10\01\41\00\0b\87\80\80\80\00\00\41\00\11"
    "\00\00\0b\84\80\80\80\00\00\10\01\0b"
  )
""
)