(assert_invalid
  (module binary
    "\00\61\73\6d\01\00\00\00\01\84\80\80\80\00\01\60"
    "\00\00\02\95\80\80\80\00\01\03\65\6e\76\0d\65\78"
    "\74\65\72\6e\61\6c\5f\66\75\6e\63\00\00\03\82\80"
    "\80\80\00\01\00\0a\9f\80\80\80\00\01\99\80\80\80"
    "\00\01\01\7f\03\40\20\00\41\01\6a\21\00\20\00\41"
    "\80\80\02\49\0d\00\0b\10\00\0b"
  )
""
)