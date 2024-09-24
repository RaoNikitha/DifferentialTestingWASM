;; 6. Create a scenario with an `if` instruction where the `else` block contains a `br_table` with indices pointing to labels defined outside of the `if` block scope, testing how both implementations handle out-of-scope label references.

(assert_invalid
  (module (func $br_table-out-of-scope
    (block (br 0))
    (if (i32.const 0) (then) (else (br_table 0 1 2)))
  ))
  "invalid label"
)