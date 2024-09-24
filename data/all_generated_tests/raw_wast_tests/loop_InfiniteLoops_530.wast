;; 1. **Test Conditional Branch Inside Loop**:    Validate a loop containing a `br_if` instruction that depends on a constant false condition. Ensure the loop runs infinitely if the condition is always false.

(assert_invalid
  (module
    (func (loop (br_if 0 (i32.const 0))))
  )
  "loop cannot run infinitely"
)