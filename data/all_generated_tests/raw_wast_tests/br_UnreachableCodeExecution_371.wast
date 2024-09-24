;; 2. Construct a block of code with multiple nested control structures and use `br` to jump over an `unreachable` instruction within a deeply nested `if` block, verifying that the control flow does not execute the `unreachable` path.

(assert_invalid
  (module
    (func (result i32)
      (block (result i32)
        (block (result i32)
          (if (result i32)
            (then (block (result i32) (br 2 (unreachable))))
            (else (i32.const 1))
          )
        )
      )
    )
  )
  "type mismatch"
)