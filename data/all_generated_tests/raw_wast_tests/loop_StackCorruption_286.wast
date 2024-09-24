;; 7. Verify a `loop` that performs heavy arithmetic operations, particularly focusing on integer overflow and underflow cases. Ensure that arithmetic exceptions do not corrupt the operand stack during inversion steps in the loop.

(assert_invalid
  (module (func $arith-overflow-loop
    (i32.const 0) (loop (result i32)
      (i32.const -2147483648) 
      (i32.sub) 
      (br 0)
    )
  ))
  "integer overflow"
)