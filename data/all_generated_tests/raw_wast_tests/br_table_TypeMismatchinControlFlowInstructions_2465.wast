;; 5. **Test Description**: Create a loop with a default branch expecting an `i32` but with `br_table` targets expecting `i64`.

(assert_invalid
  (module
    (func (param i32) (result i32)
      (loop (result i32)
        (block (result i64)
          (br_table 0 1 (i64.const 0) (local.get 0))
        )
      )
    )
  )
  "type mismatch"
)