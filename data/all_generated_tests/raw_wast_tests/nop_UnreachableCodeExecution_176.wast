;; 7. **Test 7**: Embed `nop` instructions within a `loop` structure which contains an `unreachable` instruction after breaking from the loop. Validate that the loop executes correctly without prematurely triggering the `unreachable`.

(assert_invalid
  (module
    (func (loop (nop) (br 0)) (unreachable))
  )
  "type mismatch"
)