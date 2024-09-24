;; Create a loop that uses br_if to exit based on a complex calculation involving multiple stack operations before the conditional check, ensuring operand stack consistency.

(assert_invalid
  (module (func $complex-stack (result i32)
    (block (result i32) 
      (loop 
        (i32.const 42) 
        (i32.const 58) 
        (i32.add)
        (i32.const 1)
        (br_if 1 (i32.eqz))
      )
      (i32.const 0)
    )
  ))
  "type mismatch"
)