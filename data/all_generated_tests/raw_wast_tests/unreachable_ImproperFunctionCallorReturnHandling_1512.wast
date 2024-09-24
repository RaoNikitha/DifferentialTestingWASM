;; 3. Create a scenario where a function contains a loop with an `unreachable` instruction inside. Call this function and verify if the looping structure continues incorrectly instead of immediately trapping.

(assert_invalid
  (module
    (func (loop (unreachable) (i32.const 1)))
  )
  "type mismatch"
)