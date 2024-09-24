;; 4. **Test Description**: Within a complex function containing `loop`, `block`, and nested `if` structures, place a `br_if` with its condition always set to zero. Check for any unintended branches.    - **Constraint Checked**: Ensures that the `br_if` does not cause a branch when the condition is false.    - **Relation to Incorrect Evaluation**: Detects if the condition evaluation in `br_if` misbehaves and incorrectly causes a branch.

(assert_invalid
  (module (func $complex-structure-test
    (block
      (loop
        (block
          (if (i32.eqz (i32.const 0))
            (block (br_if 0 (i32.const 0)))
          )
        )
      )
    )
  ))
  "type mismatch"
)