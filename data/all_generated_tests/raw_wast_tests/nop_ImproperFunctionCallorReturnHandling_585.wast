;; 6. Test a function containing `nop` instructions interspersed with multiple calls to itself, followed by a single `return`, to ensure that these `nop` instructions do not alter the stack or the sequence of function calls and returns.

(assert_invalid
  (module
    (func $recursive
      (nop)
      (call $recursive)
      (nop)
      (call $recursive)
      (nop)
      (return)
    )
  )
  "type mismatch"
)