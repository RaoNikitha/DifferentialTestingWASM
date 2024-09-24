;; **Test 6: Nested imported function containing br_table with stack inconsistency** - Nested function in Module A includes `br_table` causing stack inconsistencies. - Imported by Module B to observe how `wizard_engine` handles the abrupt stack change versus WebAssembly’s continuation.

(assert_invalid
  (module
    (import "moduleA" "funcA" (func $imported (result i32)))
    (func $test
      (block
        (call $imported)
        (block (br_table 0 (i32.const 1)))
      )
    )
  )
  "type mismatch"
)