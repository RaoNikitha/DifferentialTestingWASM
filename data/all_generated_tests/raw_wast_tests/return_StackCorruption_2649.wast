;; 8. **Test with Parameterized Functions**    - Develop a function receiving multiple parameters and using the return instruction, some parameters may remain on the stack after manipulation.    - Check that the stack retains correct parameter values post-return.    - Relates to correct handling of function parameters and ensuring no parameter corruption on return.

(assert_invalid
  (module
    (func $test-stack-unwinding (param i32 i32) (result i32)
      (local.get 0)
      (local.get 1)
      (i32.add)
      (return)
      (local.get 0)
    )
  )
  "type mismatch"
)