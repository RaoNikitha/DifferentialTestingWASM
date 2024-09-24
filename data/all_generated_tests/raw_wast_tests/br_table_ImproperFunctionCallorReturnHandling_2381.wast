;; 1. Test a `br_table` instruction that branches indirectly to a label index, where an immediate `call` instruction follows each target label to check if the correct function is called according to the indexed label value. If a wrong function is called, it highlights improper handling of the stack or indexing.

(assert_invalid
  (module
    (func $check_br_table
      (block (br_table 0 0 (call $func1) (i32.const 0)))
      (block (call $func2) (br $invalid))
    )
    (func $func1)
    (func $func2)
  )
  "unknown label"
)