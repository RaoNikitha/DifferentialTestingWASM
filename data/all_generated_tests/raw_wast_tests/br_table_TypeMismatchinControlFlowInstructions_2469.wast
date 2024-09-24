;; 9. **Test Description**: Construct a loop producing `f32` located within another block that produces `i32` with `br_table` branching into each other.

(assert_invalid
  (module
    (func
      (param i32)
      (result i32)
      (block (result i32)
        (loop (result f32)
          (block
            (i32.const 0)
            (br_table 0 1 (local.get 0))
          )
        )
      )
    )
  )
  "type mismatch"
)