;; 9. Design a test with nested loops where an outer loop condition incorrectly depends on the inner loop's stack management, causing the outer loop to never exit due to operand stack errors.

(assert_invalid
  (module
    (func (result i32)
      (loop (result i32)
        (i32.const 1) 
        (loop (result i32)
          (i32.eqz (i32.const 0))
          (br_if 1)
          (br 0)
        )
        (br_if 0)
      )
    )
  )
  "operand stack error in nested loop"
)