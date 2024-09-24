;; 10. **Nested Br_if with Improper Condition Evaluation**: Construct a nested loop scenario involving a `br_if` instruction within `if` conditionals, ensuring that the `br` instruction within `br_if` evaluates conditions correctly and prevents scenarios where improper conditions lead to infinite loops.

(assert_invalid
  (module
    (func $nested-br_if-improper-condition-eval
      (loop (block (if (i32.eqz (i32.const 0)) (br_if 1 (i32.const 1))))
    )
  ))
  "unknown label"
)