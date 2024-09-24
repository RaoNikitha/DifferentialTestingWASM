;; 4. Nested `if` statements within a `loop` where `br_if` targets different label levels conditionally. Ensure that conditions effectively lead to breaking out of the loop and that the operand stack consistency is maintained.

(assert_invalid
  (module
    (func (result i32)
      (block (result i32)
        (loop (result i32)
          (if (result i32) 
            (i32.const 1) 
            (block 
              (br_if 1 (i32.const 1))
              (i32.const 1)
            )
          )
          (i32.const 0)
        )
      )
    )
  )
  "type mismatch"
)