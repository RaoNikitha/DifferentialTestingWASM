;; 3. Sequence an `if` statement with a constant condition evaluating to false, containing a `nop` and `unreachable` instruction. Confirm that the branch does not jump to the `unreachable` instruction erroneously.

(assert_invalid
  (module
    (func (result i32)
      (if (i32.const 0)
        (then (nop) (unreachable))
      )
      (i32.const 1)
    )
  )
  "type mismatch"
)