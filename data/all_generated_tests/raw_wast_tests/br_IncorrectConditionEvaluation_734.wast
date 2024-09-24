;; 5. **Test Description:**    - Use a `br_if` inside a block, but set the condition to a constant zero and ensure the operand stack correctly manages the non-branch path, ensuring a proper control flow.    - **Constraint Checked:** Branch should not be taken when condition is constant zero.    - **Test Relation:** Ensures conditional evaluation always yields non-branch if condition is statically false.

(assert_invalid
  (module (func $test-br-if-zero (result i32)
    (block (result i32)
      (i32.const 42)
      (br_if 0 (i32.const 0))
    )
  ))
  "type mismatch"
)