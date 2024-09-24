;; 4. Place a `nop` before a `br` instruction that branches to a block containing an `unreachable`. Ensure the branching does not trap incorrectly before reaching the `unreachable`.

(assert_invalid
  (module
    (func (block $out
            (nop)
            (br $out)
            (unreachable)
    ))
  )
  "invalid block")
