;; Test 8: Implement a `br_table` in blocks where certain label targets have mismatched operand types with stack configurations, causing type misalignment and ensuring stack type polymorphism is respected. - **Constraint Tested**: Stack-polymorphism and operand type alignment validation.

(assert_invalid
  (module
    (func $mismatched-stack-polymorphism
      (block $block1
        (block $block2 (result f32) (br_table $block1 $block2 (i32.const 0)))
        (i32.const 0)
      )
    )
  )
  "type mismatch"
)