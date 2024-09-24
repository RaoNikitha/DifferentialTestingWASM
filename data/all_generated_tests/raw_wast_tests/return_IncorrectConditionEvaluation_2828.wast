;; 7. **Boolean Logic Conditions**:    - Use complex boolean logic to set conditions for `br_if` that could trigger a return. Implement tests to see if incorrect condition evaluation mishandles the boolean logic causing unexpected returns.

(assert_invalid
  (module
    (func $boolean-logic-mismatch (result i32)
      (i32.const 1)
      (i32.const 0)
      (i32.or)
      (br_if 0 (return))
    )
  )
  "type mismatch"
)