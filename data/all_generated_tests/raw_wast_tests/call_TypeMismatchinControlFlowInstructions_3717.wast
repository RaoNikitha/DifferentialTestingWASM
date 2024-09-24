;; 6. Use a call instruction within a `br_if` (conditional break) leading to a block with mismatched return types based on the stack’s expected state.

(assert_invalid
  (module
    (func $callee (param i32) (result i32) (i32.const 1))
    (func $caller
      (i32.const 0)
      (br_if 0 (call $callee (i32.const 5)))
    )
  )
  "type mismatch"
)