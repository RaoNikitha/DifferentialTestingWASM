;; 10. Create a test with a `loop` where the block type specifies multiple return values, but the actual loop body only returns a single value. This checks the management of stack expectations versus actual operand handling in control flow.

(assert_invalid
  (module
    (func
      (loop (result i32 i32)
        (i32.const 1) 
        br 0
      )
    )
  )
  "type mismatch"
)