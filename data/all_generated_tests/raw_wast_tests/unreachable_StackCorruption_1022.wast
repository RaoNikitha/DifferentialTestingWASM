;; 3. **Test 3: Loop with `unreachable`**    - A loop that internally contains an `unreachable` instruction.    - Investigates the behavior when the control flow is terminated abruptly by a trap during iterative operations.    - Ensures loops do not lead to stack overflows or corruption due to improper stack handling post-trap.

(assert_invalid
  (module (func (loop (i32.const 1) (unreachable) (br 0 (i32.const 2))))
  )
  "type mismatch"
)