;; 2. **Test of Function Return in a br_table Default Case**:     - Create a scenario where a function returns a value to be used in a `br_table` default case. The function’s return value will drive an out-of-bounds index to the `br_table` which should lead to the default target.    - *Constraint*: Ensure that the return value is properly handled and passed into the `br_table` instruction.    - *Relation to Improper Function Call or Return Handling*: Validates correct return handling from functions and proper passing of such returned values to subsequent instructions.

(assert_invalid
  (module (func $func-return-br_table-default
    (block (result i32)
      (block (result i32)
        (br_table 0 1 (call $invalid-return) (i32.const 0))
      )
    )
  )
  (func $invalid-return (result i32)
    (i32.const 5)
  ))
  "type mismatch"
)