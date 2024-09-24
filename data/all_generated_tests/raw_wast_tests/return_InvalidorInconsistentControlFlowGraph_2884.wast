;; 3. **Test 3**: Implement a function containing conditional branches (`if`, `else`) with `return` placed only within one conditional path. This ensures checking if the `return` instruction is handled differently depending on whether the condition is met, leading to varied CFG interpretations.

(assert_invalid
  (module
    (func $conditional_return (result i32)
      (if (i32.const 1)
        (then 
          (return (i32.const 10))
        )
        (else
          (i32.const 20)
        )
      )
    )
  )
  "type mismatch"
)