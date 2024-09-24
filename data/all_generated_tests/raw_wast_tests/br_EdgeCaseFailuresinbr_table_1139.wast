;; 10. **Deep Nesting and Complex Control Flow:**    - Test a deeply nested structure with complex control flow using `br_table` with various indices to see if the relative lookup and control flow correctly resolve to intended labels.    - **Constraint:** Verifies correct relative label indexing in deep nested structures, handling edge cases of control flow.

(assert_invalid
  (module
    (func $deep-nest-complex-control (result i32)
      (block (result i32)
        (loop (result i32)
          (block (result i32)
            (loop (result i32)
              (block (result i32)
                (br_table 0 1 2 (i32.const 1))
              )
            )
          )
        )
      )
    )
  )
  "type mismatch"
)