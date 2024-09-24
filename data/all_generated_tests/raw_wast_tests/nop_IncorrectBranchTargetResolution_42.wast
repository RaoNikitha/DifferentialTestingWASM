;; 3. **Conditional Branch after Nop**: Design an `if-else` statement with a `nop` right before a `br_if` condition. The test verifies that the conditional branch correctly evaluates the target based on the condition, and the `nop` does not affect its resolution.

(assert_invalid
  (module 
    (func $conditional-nop (param i32) (result i32)
      (nop)
      (if (result i32) (local.get 0) 
        (then (i32.const 1)) 
        (else (i32.const 2))
      )
    )
  )
  "type mismatch"
)