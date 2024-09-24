;; 1. **Loop with Nested Block and Unnecessary Pops**: Test a loop that contains a nested block with numerous pop operations, ensuring proper validation and stack management at deep nesting levels. This will check if `Wizard Engine` incorrectly manages operand stack inside the nested block in `loop` constructs.

(assert_invalid
  (module (func $nested-block-with-pops
    (i32.const 0) (loop (result i32)
      (block 
        (drop) (drop) (drop) ; excessive pops
      )
      (i32.const 1)
    ))
  )
  "type mismatch"
)