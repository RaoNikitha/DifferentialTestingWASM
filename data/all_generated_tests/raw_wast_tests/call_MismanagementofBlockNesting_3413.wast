;; 2. **Type Mismatch in Deeply Nested Loop**:    - **Description**: Design a loop nested within multiple blocks that calls a function with a type signature that mismatches the expected stack signature.    - **Constraint**: The function's type should mismatch the expected type at the call point, ensuring proper type validation in the loop context.    - **Relation to Mismanagement of Block Nesting**: Tests if nested loops properly manage type contexts and identify type mismatches accurately.

(assert_invalid
  (module
    (func $nested-loop-type-mismatch (param i32)
      (block
        (loop
          (block
            (loop
              (call 0 (i32.const 1))
            )
          )
        )
      )
    )
    (func (param f64)) 
  )
  "type mismatch"
)