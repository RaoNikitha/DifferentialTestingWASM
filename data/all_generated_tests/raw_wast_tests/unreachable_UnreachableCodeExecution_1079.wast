;; 10. Implement a `br` instruction to jump to a `block` containing only the `unreachable` instruction, verifying that the trap is correctly and consistently handled upon reaching the `unreachable` target through branch mechanisms.

(assert_invalid
  (module
    (func (block (br 0) (block (unreachable))))
  )
  "type mismatch"
)