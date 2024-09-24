;; 7. **Test Description:** Implement a complex control flow `block` with multiple `br_if` statements targeting the block itself, but one condition is always true.     - **Constraint Checked:** Tests handling of complex control flows and correct branching conditions.     - **Infinite Loop Relation:** Always true condition in `br_if` can create an unintended infinite loop within the block.

(assert_invalid
  (module (func $test-complex-control-flow (result i32)
    (block (result i32)
      (block (result i32)
        (br_if 1 (i32.const 1)) (i32.const 99)
      )
      (br_if 0 (i32.const 1))
    )
  ))
  "type mismatch"
)