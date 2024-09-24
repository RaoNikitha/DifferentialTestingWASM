;; 10. Design a test case where `br_table` has multiple labels with the same default label, but the operand stack is manipulated before the branch, testing for stack overflow handling.

(assert_invalid
  (module (func $test-stack-overflow
    (block $label1
      (block $label2
        (block $label3
          (i32.const 10)
          (i32.const 20)
          (i32.sub)
          (i32.const 30)
          (br_table $label1 $label1 $label1 (i32.const 4))
        )
      )
    )
  ))
  "stack overflow"
)