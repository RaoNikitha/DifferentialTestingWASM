(assert_invalid
  (module binary
    "\00\61\73\6d\01\00\00\00\01\84\80\80\80\00\01\60"
    "\00\00\02\91\80\80\80\00\01\07\4d\6f\64\75\6c\65"
    "\41\05\66\75\6e\63\41\00\00\03\82\80\80\80\00\01"
    "\00\07\89\80\80\80\00\01\05\66\75\6e\63\42\00\01"
    "\0a\9b\80\80\80\00\01\95\80\80\80\00\00\02\40\02"
    "\40\02\40\02\40\02\40\41\01\0d\04\0b\0b\0b\0b\0b"
    "\0b"
  )
""
)