;; 8. **Test Name: No-Operation in Function Call Loops**    - **Description**: Place `nop` instructions inside loops that include repeated function calls.    - **Constraint**: Verify loop and function call interplay is not disrupted by `nop`.    - **Improper Handling Check**: Tests if `nop` insertion causes issues within looped function call sequences.    - **Expected Behavior**: Proper handling of looping and function calls remains consistent.

(assert_invalid
  (module
    (func $loop-with-nop
      (block $outer
        (loop $inner
          (call $some_func)
          nop
          (br $inner)
        )
      )
    )
    (func $some_func)
  )
  "type mismatch"
)