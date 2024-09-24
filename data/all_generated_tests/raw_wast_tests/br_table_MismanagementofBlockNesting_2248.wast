;; 8. **Complex Nesting with Immediate Parameter Encoding:**    - Create complex nested blocks and loops with multiple `br_table` instructions having large vectors of label indices and default labels.    - Tests if immediate parameters are correctly encoded and managed without misinterpretation or misdirected branches.

(assert_invalid
  (module
    (func (param i32) (param i32) (result i32)
      (block (result i32)
        (loop (result i32)
          (block (result i32)
            (br_table 0 3 1 2 4 (i32.const 1) (i32.const 2))
          )
        )
      )
    )
  )
  "unknown label"
)