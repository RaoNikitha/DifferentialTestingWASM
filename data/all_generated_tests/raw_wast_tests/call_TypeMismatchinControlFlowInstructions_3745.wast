;; 4. **Conditional Branch Type Checking**:    Formulate a conditional branch where the resulting type is `i32`, however, the called function's return type is `i64`. Ensure that the type mismatch is correctly trapped or handled.

(assert_invalid
  (module
    (func $f (result i32)
      (if (result i32) (i32.const 1) (then (call $g)))
    )
    (func $g (result i64))
  )
  "type mismatch"
)