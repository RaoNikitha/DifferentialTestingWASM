;; 1. **Testing Excessive Operand Consumption:**    Design a branch instruction within a deeply nested control structure where the operand stack has exactly one more operand than required. Verify if both implementations can correctly handle the popping of excess operands while ensuring the stack integrity is maintained.

(assert_invalid
  (module
    (func
      (block (result i32)
        (block (result i32)
          (block (result i32)
            (i32.const 1)
            (i32.const 2)
            (br 0)
            (drop)
          )
          (drop)
        )
      )
    )
  )
  "type mismatch"
)