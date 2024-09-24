;; 1. **Test Description**: A `br_table` with a label vector containing one valid label and a mismatching arity compared to the default label, ensuring that the arity check triggers an error.

(assert_invalid
  (module
    (func
      (block (result i32)
        (block (result i64 i32)
          (br_table 0 1 (i32.const 0))
        )
      )
    )
  )
  "type mismatch"
)