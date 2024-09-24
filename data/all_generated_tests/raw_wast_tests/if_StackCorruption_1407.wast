;; Design a scenario where the `if` block includes loops that manipulate the stack in ways that could lead to stack overflow or underflow, ensuring the implementation maintains stack integrity through multiple control passes.

(assert_invalid
  (module (func
    (block $outer 
      (i32.const 1)
      (if (result i32) (i32.const 1)
        (then (loop $inner 
          (br 1)
        ))
        (else (loop $inner 
          (br 1)
        ))
      )
      (drop)
    )
  ))
  "stack mismatch"
)