;; 4. Incorrect operand stack handling in loops:    Create a `loop` with specific input and output types, and introduce a `br` that manipulates the operand stack inconsistently. The validator should catch stack mismatches, testing stack unwinding and operand consistency in CFG.

(assert_invalid
  (module 
    (func $incorrect-operand-stack-in-loop 
      (result i32) 
      (loop (result i32) 
        (br 0 (i32.const 10) (i32.const 20)) 
        (i32.const 30)
      )
      (i32.const 40)
    )
  )
  "type mismatch"
)