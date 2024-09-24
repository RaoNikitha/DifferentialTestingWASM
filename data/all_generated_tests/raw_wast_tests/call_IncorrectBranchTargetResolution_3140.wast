;; 9. **Test Description**:    - Design a function `F1` that calls function `F2`, where `F2` contains local changes affecting control flow.    - Within `F2`, branch to labels inside `F2` but also affecting the return to `F1`.    - Implement branches in `F1` based on conditions affected by `F2` call to validate return control flow.    - **Constraint Checked**: Verify correct control flow maintenance between nested function calls and branching.    - **Incorrect Branch Target Resolution**: Mis-resolved targets in `F2` may incorrectly signal returns, disrupting `F1`'s control flow.

(assert_invalid
  (module
    (func $F2
      (local i32)
      (local.set 0 (i32.const 1))
      (block $label $label1
        (br_if $label1 (local.get 0))
        (return)
      )
      (local.set 0 (i32.const 0))
    )
    (func $F1
      (call $F2)
      (if (local.get 0)
        (then (return))
      )
      (local.set 0 (i32.const 1))
    )
  )
  "type mismatch"
)