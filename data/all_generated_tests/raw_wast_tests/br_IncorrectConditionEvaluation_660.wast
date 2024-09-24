;; 1. **Test Description**: Create a test that sets a condition where a backward `br_if` instruction targets a loop. Use a condition that evaluates to `false`. Verify if the condition evaluation correctly prevents the branch.

(assert_invalid
  (module (func $backward-br-if-loop
    (loop
      (br_if 0 (i32.const 0))
    )
  ))
  "type mismatch"
)