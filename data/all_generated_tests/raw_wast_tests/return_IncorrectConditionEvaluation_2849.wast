;; 8. Make a function with multiple conditional returns, where the conditions depend on stack values manipulated by previous blocks. Check if each `return` properly evaluates conditions and unwinds the stack relative to the correct outermost block.

(assert_invalid
  (module
    (func $conditional_returns (result i32)
      (local i32)
      (i32.const 1)
      (if (result i32) 
        (then 
          (i32.const 2)
          (return)
        )
        (else 
          (i32.const 3)
          (return)
        )
      )
    )
  )
  "type mismatch"
)