;; 8. Write a WebAssembly module where the table has `funcref` with type `[] -> []` but call it indirectly with a type `i32 -> []`. The mismatch between expected stack operands (`i32` is extra) should ensure a type mismatch trap.

(assert_invalid
  (module
    (type $sig_empty (func))
    (type $sig_with_param (func (param i32)))
    (func $f (type $sig_empty))
    (table funcref (elem $f))
    (func $test
      (call_indirect (type $sig_with_param) (i32.const 0))
    )
  )
  "type mismatch"
)