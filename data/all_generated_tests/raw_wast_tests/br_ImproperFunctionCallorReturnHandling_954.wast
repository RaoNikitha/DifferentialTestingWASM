;; 5. **Test 5: Invalid Function Call Targeted by `br` in `if` Block**    - **Description:** Implement an `if` block with a `br` instruction leading to an invalid function call (wrong type/signature). Test correct error catching and operand stack integrity.    - **Reasoning:** Ensures that incorrectly typed function calls in conditional branches are properly managed.

(assert_invalid
  (module (func $invalid-func-call-in-if
    (if (i32.const 1)
      (then 
        (br 0 (call 1))
      )
    )
  ))
  "type mismatch"
)