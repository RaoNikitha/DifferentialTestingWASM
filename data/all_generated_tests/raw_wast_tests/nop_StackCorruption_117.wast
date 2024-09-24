;; 8. Incorporate `nop` instructions into a sequence of `call` and `call_indirect` instructions handling tables and function pointers to confirm no unintended stack results from `nop` presence during indirect call management.

(assert_invalid
  (module
    (table 1 funcref)
    (elem (i32.const 0) $func)
    (func $func)
    (func $test
      (nop)
      (call $func)
      (nop)
      (call_indirect (type (func)) (i32.const 0))
      (result i32)
    )
  )
  "type mismatch"
)