;; 4. **Infinite Loop with Conditional Branching**:    - Develop a `loop` that may result in an infinite loop due to a `br_if` instruction with a condition that never becomes false. Validate if both implementations construct an accurate CFG that reflects potential infinite loops.

(assert_invalid
  (module (func $infinite-loop
    (loop (result i32)
      (i32.const 1)
      (br_if 0)
    )
  ))
  "infinite loop detected"
)