;; 3. Use an `if` instruction with an immediately following `unreachable` instruction to ensure the CFG handles the unreachable code correctly after the conditional jump.

(assert_invalid
  (module (func $if-unreachable
    (if (i32.const 1) (then (unreachable)))
  ))
  "unreachable instruction"
)