;; 2. **Test Description**:     - Implement nested loops where an inner loop contains a `br_if` with a true condition that erroneously targets the outer loop.    - **Constraint Checking**: Checks the correct reference and unwinding of nested labels within loops.    - **Infinite Loop Relation**: Ensures the inner loop doesn't cause infinite loops by mistakenly targeting the wrong label, focusing on label argument handling in the `wizard_engine`.

(assert_invalid
  (module
    (func $nested-loop-br_if
      (loop
        (loop
          (br_if 1 (i32.const 1))
        )
      )
    )
  )
  "unknown label"
)