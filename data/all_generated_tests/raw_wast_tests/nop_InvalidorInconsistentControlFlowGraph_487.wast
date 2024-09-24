;; 8. **Test with `nop` in Function Call Sequences:**    - Place `nop` within a sequence of function calls to confirm that the `nop` does not interfere with the control flow between function invocations.    - **Constraint Tested:** Ensures `nop` does not disrupt the control flow across multiple function calls.

(assert_invalid
  (module 
    (func $test1 
      (call $func1)
      (nop)
      (call $func2)
    )
    (func $func1)
    (func $func2)
  )
  "invalid function call sequence"
)