;; Test 8: Have an `if` instruction where a `void` block type leads into a `then` block that mistakenly assumes the presence of an `i64` type on the stack.

(assert_invalid
  (module (func (if (then (drop)) (else (drop)))))
  "type mismatch"
)