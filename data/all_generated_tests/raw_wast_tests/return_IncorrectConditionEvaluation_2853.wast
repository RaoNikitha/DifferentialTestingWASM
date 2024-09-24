;; 2. Verify whether the `br_if` instruction correctly jumps to a specific block for a true condition by giving it a condition that evaluates to `1`. Incorrect evaluation may lead to no jump irrespective of the true condition.

(assert_invalid
  (module
    (func $br_if-true-branch (result i32)
      (i32.const 1)
      (block (br_if 0 (return) (i32.const 1)))
    )
  )
  "type mismatch"
)