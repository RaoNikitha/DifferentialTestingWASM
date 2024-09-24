;; 4. **Test Description**:    Use an `if` block to check an integer predicate, in `then` branch add four integers, in `else` branch remove three integers, ensuring equal operand stack height at `end`.

(assert_invalid
  (module
    (func
      (i32.const 1)
      (if (result i32)
        (i32.const 1)
        (then
          (i32.const 1) (i32.const 1) 
        )
        (else
          (drop) (drop) (drop)
        )
      )
      (drop)
    )
  )
  "type mismatch"
)