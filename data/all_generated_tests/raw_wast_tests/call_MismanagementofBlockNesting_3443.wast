;; 2. **Test 2**:    - **Description**: A sequence of nested `if-else` blocks where each condition results in a call to a function that requires varying types and depths.    - **Constraint Checked**: Verifies the type-checking mechanism by evaluating correctness in different conditional branches.    - **Relation to Block Nesting**: Tests the accuracy of handling stack operations in deeply nested conditional statements.

(assert_invalid
  (module
    (func $type-nested-if-else
      (if (result i32)
        (i32.eq (i32.const 1) (i32.const 1))
        (then (call 0 (i32.const 42)))
        (else (if (result i32)
          (i32.eq (i32.const 2) (i32.const 2))
          (then (call 1 (i32.const 3) (i32.const 4)))
          (else (i32.const 0))
        ))
      )
    )
    (func (param i32) (result i32))
    (func (param i32 i32) (result i32))
  )
  "type mismatch"
)