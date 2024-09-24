;; 6. **Test Description**: Incorporate `br_table` in a nested block structure, where the outer block expects `i32`, but the inner block (branch target) expects `f32`.

(assert_invalid
  (module
    (func
      (block (result i32)
        (block (result f32)
          (i32.const 0)
          (br_table 0 1 (i32.const 0))
        )
      )
    )
  )
  "type mismatch"
)