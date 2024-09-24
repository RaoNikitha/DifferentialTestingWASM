;; Test nested loops where the inner loop contains a `br_if` instruction to the outer loop with a condition that is always true to ensure proper CFG management across nesting levels.

(assert_invalid
  (module
    (func (result i32)
      (loop (result i32)
        (loop (result i32)
          (br_if 1 (i32.const 1)))))))