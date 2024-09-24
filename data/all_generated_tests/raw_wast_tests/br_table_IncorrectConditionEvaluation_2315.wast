;; 5. Provide an operand close to the upper boundary of label indices to a `br_table`. Validate if an incorrect condition interpretation sends control to an unintended block.

(assert_invalid
  (module
    (func (param i32) (result i32)
      (block 
        (br_table 0 1 2 3 (i32.const 4) (local.get 0))
      )
    )
  )
  "unknown label"
)