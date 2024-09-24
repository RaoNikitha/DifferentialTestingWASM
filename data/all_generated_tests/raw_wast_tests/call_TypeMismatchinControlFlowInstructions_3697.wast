;; 6. **Test 6**: Test calls a function within a block where the arguments provided are of type `[i64]`, but the function signature requires `[i32]`. This checks if type constraints of arguments within block contexts are correctly enforced.

(assert_invalid
  (module
    (func $type-mismatch-within-block
      (block
        (call $requires-i32 (i64.const 10))
      )
    )
    (func $requires-i32 (param i32))
  )
  "type mismatch"
)