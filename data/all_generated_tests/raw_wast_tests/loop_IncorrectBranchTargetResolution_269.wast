;; 10. **Mixed Control Flow Instructions**:     Integrate `if`, `block`, and `loop` instructions with similar label indices, and place `br` instructions inside the loop that should target selective labels. Check the isolation of loop-specific labels and ensure branches resolve properly during different execution paths.

(assert_invalid
  (module
    (func $mixed-control
      (block (result i32)
        (loop (result i32)
          (i32.const 0)
          (br_if 0 (i32.const 1))
          (br 1)
        )
      )
    )
  )
  "type mismatch"
)