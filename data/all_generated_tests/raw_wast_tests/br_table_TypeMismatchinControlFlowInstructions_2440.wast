;; Formulate a differential test for the `br_table` instruction inside an innermost block, where the label vector targets multiple blocks, one of which should have an operand mismatch in terms of floating-point types such as `f32` instead of integral types like `i32` and `i64`, ensuring type checks are handled at the granularity level of control blocks. ```

(assert_invalid
  (module
    (func $label-type-mismatch
      (block
        (block
          (block (result f32)
            (br_table 0 1 2 (i32.const 1))
          )
        )
      )
    )
  )
  "type mismatch"
)