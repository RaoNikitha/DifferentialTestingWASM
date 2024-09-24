;; 3. Implement an `if-else` structure where `unreachable` is within the `if` block, and the `else` block contains a `br` instruction targeting a label outside the `if-else` structure. Ensure the trap occurs before any branching logic resolves.

(assert_invalid
  (module 
    (func
      (if (result i32) (i32.const 1)
        (then (unreachable))
        (else (br 0))
      )
    )
  )
  "type mismatch"
)