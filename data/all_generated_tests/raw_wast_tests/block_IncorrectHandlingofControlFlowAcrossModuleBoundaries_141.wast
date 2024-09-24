;; 2. **Test Description**: Implement a nested `block` structure with branches targeting an imported function that itself contains a `block` with conflicting types.    **Constraint**: Check if labels and control flow are correctly managed across nested blocks and module calls.

(assert_invalid
  (module
    (import "env" "foo" (func $foo (result i64)))
    (func $test
      (block (result i32)
        (i32.const 1)
        (block (result i64) 
          (call $foo)
          (block (result i32) 
            (br 1)
          )
        )
      )
    )
  )
  "type mismatch"
)