;; 3. **Test Description**: Design a test where an `if` instruction's block type expects no outputs (`[] -> []`), but both the `then` and `else` branches produce an `i32` value.    - **Constraint Checked**: Validate that no values are pushed to the stack if the block type specifies no outputs.    - **Expected Behavior**: The implementation should trap or validate error when any branch of the `if` incorrectly pushes values.

(assert_invalid
  (module (func (if (result) (i32.const 1) (then (i32.const 1)) (else (i32.const 1)))))
  "type mismatch"
)