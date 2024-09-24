;; 3. **Test Description 3**:    - **Scenario**: Insert a `nop` within a function sequence that includes nested `call` instructions to multiple functions.    - **Constraint Check**: The `nop` should not disturb the nested calls and returns.    - **Relation to Improper Handling**: Checks for correct management of nested function calls and return sequences.

(assert_invalid
  (module
    (func $nested-calls
      (call $func1)
      (nop)
      (call $func2)
    )
    (func $func1)
    (func $func2)
  )
  "type mismatch"
)