;; 3. Define an `if` block with its own nested `if-else` blocks inside a loop, and use a combination of `br` and `br_if` instructions within the innermost `else` branch to branch to different depths. This tests the precise handling of nested control flows and the reset mechanism after the `br` instruction.

(assert_invalid
  (module
    (func $nested-if-inside-loop
      (loop (result i32)
        (if (result i32)
          (i32.const 1)
          (then
            (if (result i32)
              (i32.const 0)
              (then
                (br 2 (i32.const 42))
              )
              (else
                (br_if 1 (i32.const 1))  
                (i32.const 2)
              )
            )
          )
          (else 
            (i32.const 3)
          )
        )
      )
    )
  )
  "type mismatch"
)