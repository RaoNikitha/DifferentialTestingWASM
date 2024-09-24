;; 3. Test a function that first performs a `call` to another function, then a `nop`, and finally a `return`, to confirm that the return value from the called function is unaffected by the presence of `nop`.

(assert_invalid
  (module
    (func $innerFunc (result i32) (i32.const 42))
    (func $testFunc (result i32)
      (call $innerFunc)
      (nop)
      (return))
  )
  "type mismatch"
)