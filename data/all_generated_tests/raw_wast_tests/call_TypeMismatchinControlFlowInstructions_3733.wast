;; 2. **Block with Incorrect Type Matching**:    - **Description**: Construct a block that calls a function expecting a string argument but provides a numeric argument instead.    - **Reasoning**: Tests whether the implementations correctly enforce the expected argument type within block scopes.    - **Constraint**: The test should fail in enforcing type constraints at block boundaries.    - **Relation**: Validates consistent type checking for arguments passed in block scopes.

(assert_invalid
  (module
    (func $block-incorrect-type
      (block
        (call 0 (i32.const 42))
      )
    )
    (func (param (result i32)))
  )
  "type mismatch"
)