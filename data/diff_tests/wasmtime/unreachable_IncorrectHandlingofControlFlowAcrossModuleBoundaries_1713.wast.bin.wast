(assert_invalid
  (module binary
    "\00\61\73\6d\01\00\00\00\01\84\80\80\80\00\01\60"
    "\00\00\02\9f\80\80\80\00\03\01\42\05\66\75\6e\63"
    "\31\00\00\01\42\05\66\75\6e\63\32\00\00\01\42\05"
    "\66\75\6e\63\33\00\00\03\82\80\80\80\00\01\00\0a"
    "\8f\80\80\80\00\01\89\80\80\80\00\00\10\00\10\01"
    "\10\02\00\0b"
  )
""
)