(assert_invalid
  (module binary
    "\00\61\73\6d\01\00\00\00\01\84\80\80\80\00\01\60"
    "\00\00\02\a1\80\80\80\00\02\03\65\6e\76\09\6d\6f"
    "\64\41\5f\66\75\6e\63\00\00\03\65\6e\76\09\6d\6f"
    "\64\42\5f\66\75\6e\63\00\00\03\83\80\80\80\00\02"
    "\00\00\04\85\80\80\80\00\01\70\01\01\01\09\87\80"
    "\80\80\00\01\00\41\00\0b\01\00\0a\96\80\80\80\00"
    "\02\84\80\80\80\00\00\10\01\0b\87\80\80\80\00\00"
    "\41\00\11\00\00\0b"
  )
""
)