;; 8. **Test Description**: Use `br_table` within a function that should return `i32` but includes branch targets returning `f64`, featuring a default branch as `i32`.

(assert_invalid
  (module (func
    (block (result i32)
      (block (result f64)
        (block (result i32)
          (br_table 0 1 2 (i32.const 0))
        )
      )
    )
  ))
  "type mismatch"
)