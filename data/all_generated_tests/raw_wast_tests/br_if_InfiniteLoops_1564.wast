;; 5. **Test 5**: A loop containing a `br_if` instruction with a decrementing counter. If the counter does not decrement correctly due to improper operand stack handling, it could lead to an infinite loop, especially in Wizard Engine.

(assert_invalid
  (module
    (func (loop (block (br_if 1 (i32.const 1)))))
  )
  "type mismatch"
)