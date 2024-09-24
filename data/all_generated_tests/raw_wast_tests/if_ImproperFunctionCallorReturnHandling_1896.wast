;; 7. **Conditional Jump with Multiple Returns**:    Test an `if` block where a function is called at the end, prompting multiple return scenarios in both `then` and `else`. Determine if improper handling results in inconsistency in returned values when executing conditionally.

(assert_invalid
 (module
  (func $type-multiple-returns (param i32) (result i32)
   (if (param i32) (result i32) (local.get 0)
    (then (i32.const 1) (call $dummy_fun))
    (else (i32.const 0) (call $dummy_fun))
   )
  )
  (func $dummy_fun (result i32) (i32.const 42))
 )
 "type mismatch"
)