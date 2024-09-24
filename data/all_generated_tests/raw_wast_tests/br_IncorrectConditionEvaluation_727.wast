;; 8. **Test Description:**    Check a `br_if` inside a `block` where the condition involves a global variable modified by prior instructions. Ensure the branch happens correctly based on the updated global state.    - **Constraint Checked:** Correct handling of global variables' conditions within `br_if`.    - **Relation to Incorrect Condition Evaluation:** Prevents erroneous branching decisions based on static/global states.

(assert_invalid
  (module
    (global $g i32 (i32.const 0))
    (func $test
      (block (br_if 0 (global.get $g)))
      (global.set $g (i32.const 1))
      (block (br_if 0 (global.get $g)) (nop))
    )
  )
  "type mismatch"
)