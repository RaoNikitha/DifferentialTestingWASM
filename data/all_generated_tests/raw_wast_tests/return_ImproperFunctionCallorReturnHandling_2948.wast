;; 7. **Mismatched Return Type in Recursive Call**:    Create a recursive function with varying return types at different recursion levels. Test the implementation's ability to manage the correct return types through the recursion unwinding process.

(assert_invalid
  (module
    (func $mismatched-recursive-return-type (param i32) (result i32)
      (if (local.get 0)
        (then 
          (return (call $mismatched-recursive-return-type (i32.const 0)))
        )
        (else
          (return (i32.const 0))
        )
      )
    )
  )
  "type mismatch"
)