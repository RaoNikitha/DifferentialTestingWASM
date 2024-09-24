;; 10. **Test 10**:     - **Description**: A block with a produced result type `i32`, with an inner `loop` having a `br_if` that pushes `f64`.     - **Constraint**: Ensures the type of result produced before branching is correct when extending beyond an immediate nested loop.     - **Relation to Type Mismatch**: Enforces type constraints for operand stack consistency exiting from loops.

(assert_invalid
  (module (func
    (block $outer (result i32)
      (loop $inner
        (br_if $outer (f64.const 1.0) (i32.const 1))
        (i32.const 0)
      )
    )
  ))
  "type mismatch"
)