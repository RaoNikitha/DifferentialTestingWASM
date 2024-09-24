;; 1. **Invalid Function Index in Nested Block**:    - **Description**: Create a test with a nested block structure where an inner block contains a call to a function with an invalid index. This checks if the function lookup and error handling are correctly managed.    - **Constraint**: The call should lead to an out-of-bounds index trap only within the inner scope.    - **Relation to Mismanagement of Block Nesting**: Ensures that invalid calls within nested blocks are properly encapsulated in the inner block and don't affect the outer blocks.

(assert_invalid
  (module
    (type (func (param i32)))
    (func $outer
      (block
        (call 1)
      )
    )
    (func (param i32))
  )
  "unknown function"
)