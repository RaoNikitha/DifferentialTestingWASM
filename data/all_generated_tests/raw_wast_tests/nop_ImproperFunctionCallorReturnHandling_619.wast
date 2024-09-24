;; 10. **Test Description 10**:    - **Scenario**: Place a `nop` at the start of a function that immediately calls another function and returns.    - **Constraint Check**: Confirm that the function call and return sequence is not altered by the initial `nop`.    - **Relation to Improper Handling**: Ensures that initial `nop` does not affect the entire function call-return path.

(assert_invalid
  (module
    (func $calledFunc)
    (func $testFunc
      (nop)
      (call $calledFunc)
      (return)
    )
  )
  "type mismatch"
)