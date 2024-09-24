;; 4. **Test Description**:     Construct a conditional `if-else` block inside a `block` with `br_if` instructions to different parents. Verify that each branch leads to the correct location and the stack is accurately restored after each conditional check.    - **Constraint Checked**: Correct branching in nested conditions.    - **Stack Corruption Check**: Ensures conditional branches do not cause stack anomalies.

(assert_invalid
  (module
    (func $nested-br-if
      (block (result i32)
        (block
          (if (i32.const 1)
            (then
              (br_if 1 (i32.const 42))
            )
            (else
              (br_if 0 (i32.const 99))
            )
          )
        )
        (i32.const 0)
      )
    )
  )
  "type mismatch"
)