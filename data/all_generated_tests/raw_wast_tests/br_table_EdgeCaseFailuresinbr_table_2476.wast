;; 6. **Test Description:**    Test br_table instruction with an operand stack containing non-integer types preceding the expected i32 to ensure proper stack unwinding and type matching.    - **Specific Constraint:** Checks strict type matching and correct stack handling per operand type constraints.    - **Edge Case Relation:** Incorrect stack manipulation might corrupt the state or cause crashes.

(assert_invalid
  (module
    (func $test_stack_unwind_type_match
      (block
        (f32.const 0.0) (i32.const 1)
        (br_table 0 0)
      )
    )
  )
  "type mismatch"
)