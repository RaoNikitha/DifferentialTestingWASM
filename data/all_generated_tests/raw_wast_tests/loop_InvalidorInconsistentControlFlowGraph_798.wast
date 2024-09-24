;; 9. **Loop with Excessive Nesting Levels**:     - **Description**: Create a deeply nested loop scenario where branching tests label index calculations at multiple levels of nesting, validating the limits and correctness of label handling.     - **Constraint**: Extreme nesting and label index calculation.     - **CFG Impact**: Excessive nesting tests the robustness of CFG generation against deeply embedded control structures.

(assert_invalid
  (module
    (func $deeply_nested_loop
      (loop (param i32) (result i32)
        (loop (param i32) (result i32)
          (loop (param i32) (result i32)
            (loop (param i32) (result i32)
              (loop (param i32) (result i32)
                (loop (param i32) (result i32)
                  (loop (param i32) (result i32)
                    (loop (param i32) (result i32)
                      (br 8)  ;; Excess label index
                    )
                  )
                )
              )
            )
          )
        )
      )
    )
  )
  "label index out of range"
)