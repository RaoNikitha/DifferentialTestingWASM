;; 9. **Test 9: Function with Local Drops before Return**    - Push multiple locals, drop some, and return. This tests how dropped values affect stack unwinding and overall stack state on function exit.    - *Related Constraint*: Validates proper stack frame management on locals manipulation before return.

(assert_invalid
  (module
    (func $local-drop-before-return (param i32 i32) (result i32)
      (local.get 0)
      (local.get 1)
      (drop)
      (return)
    )
  )
  "type mismatch"
)