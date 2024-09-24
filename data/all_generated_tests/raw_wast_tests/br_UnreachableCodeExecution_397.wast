;; 8. Multiple nested `if` constructs, with a `br` instruction in the innermost `then` block targeting an outer scope, and `unreachable` instructions in all `else` blocks. This ensures proper forward branching avoiding unintended unreachable paths.

(assert_invalid
  (module
    (func (result i32)
      (if (result i32)
        (i32.const 1)
        (then
          (block (br 1))
          (i32.const 0)
        )
        (else
          (unreachable)
        )
      )
    )
  )
  "label index out of bounds"
)