;; 2. **Test Description**: Define an out-of-bounds table index for a `call_indirect` instruction. Ensure that if `call_indirect` incorrectly resolves it, it executes an `unreachable` instruction in the erroneously resolved function.    - **Constraint Checked**: Boundary check for table indexing.    - **Unreachable Code Execution**: Verifies proper trapping behavior for invalid table indices, avoiding execution of the `unreachable` instruction.

(assert_invalid
  (module
    (type (func))
    (table 0 funcref)
    (func $test-unreachable
      (call_indirect (type 0) (i32.const 1))
    )
  )
  "out of bounds index"
)