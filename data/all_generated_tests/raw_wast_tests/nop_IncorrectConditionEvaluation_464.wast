;; 5. Set up an `if-else` structure where the condition is evaluated immediately after a `nop` instruction. Verify if both engines react differently in taking either the `if` or `else` path based on the condition.

(assert_invalid
  (module (func (if (nop) (then (i32.const 1)) (else (i32.const 0)))))
  "type mismatch"
)