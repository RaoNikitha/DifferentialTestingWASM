;; 3. **Conditional Branch Type Mismatch**:    - **Description**: Include a conditional branch that incorrectly calls a function needing a boolean but supplies a float value on the stack.    - **Reasoning**: Checks if the conditional branches correctly validate the types of the operands passed to the function.    - **Constraint**: Highlight any failure to perform type checks on conditional branches.    - **Relation**: Ensures that type mismatches are caught within conditional branching structures.

(assert_invalid
  (module
    (func $conditional-type-mismatch (param f32) (result i32)
      local.get 0
      if (result i32)
        (call 0)
      else
        (i32.const 0)
      end
    )
    (func (result i32)
      i32.const 42
    )
  )
  "type mismatch"
)