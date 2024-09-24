;; 3. **Triple Nested `if` Block Exits**: Design an `if` block nested three levels deep, with the innermost block having a `br` instruction. The test checks if a `break` instruction correctly exits the intended nested block.

(assert_invalid
  (module
    (func $nested-if-br (result i32)
      (if (result i32) (i32.const 1)
        (then
          (if (result i32) (i32.const 1)
            (then
              (if (result i32) (i32.const 1)
                (then (br 1))
                (else (i32.const 1))
              )
              (i32.const 0)
            )
            (else (i32.const 1))
          )
          (i32.const 0)
        )
        (else (i32.const 1))
      )
    )
  )
  "type mismatch"
)