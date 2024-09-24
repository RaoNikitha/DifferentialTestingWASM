;; 4. **Test Description:**    Implement nested blocks with br_table where the operand is exactly the number of labels, ensuring that it uses the default label.    - **Specific Constraint:** Operand equal to the length of the label vector should trigger the default.    - **Edge Case Relation:** Misunderstanding the boundary condition might lead to incorrect branching.

(assert_invalid
  (module
    (func $test-nested-blocks-out-of-bound-default
      (block
        (block
          (block
            (br_table 0 1 2 (i32.const 3))
          )
        )
      )
    )
  )
  "unknown label"
)