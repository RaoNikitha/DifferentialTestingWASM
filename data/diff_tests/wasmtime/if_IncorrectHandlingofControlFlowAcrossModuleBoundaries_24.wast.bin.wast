(assert_invalid
  (module binary
    "\00\61\73\6d\01\00\00\00\01\89\80\80\80\00\02\60"
    "\00\00\60\01\7f\01\7f\02\94\80\80\80\00\01\03\65"
    "\6e\76\0c\65\78\74\65\72\6e\61\6c\46\75\6e\63\00"
    "\00\03\82\80\80\80\00\01\01\07\91\80\80\80\00\01"
    "\0d\72\65\63\75\72\73\69\76\65\46\75\6e\63\00\01"
    "\0a\99\80\80\80\00\01\93\80\80\80\00\00\20\00\04"
    "\7f\10\00\20\00\41\01\6b\10\01\05\41\00\0b\0b"
  )
""
)