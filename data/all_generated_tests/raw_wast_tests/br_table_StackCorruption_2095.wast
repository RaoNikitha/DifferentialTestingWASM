;; 5. Construct a test using `br_table` in a loop construct with mismatched types in the operand stack and labels, ensuring forward branches properly consume operands.

(assert_invalid
  (module
    (func (param i32) (result i32)
      (loop (result i32)
        (block (result i32)
          (br_table 0 1 (i32.const 1) (f32.const 0.0))
        )
      )
    )
  )
  "type mismatch"
)