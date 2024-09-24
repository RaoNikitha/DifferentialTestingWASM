;; 5. Combine multiple `unreachable` instructions across different branches of a complex, deeply nested conditional structure and verify that no further instructions are executed after any single `unreachable`.    - **Constraint:** Immediate execution stops after any `unreachable` instruction, regardless of nesting depth.    - **CFG Check:** Confirm robust handling of control flow interruptions at various nesting levels.

(assert_invalid
  (module (func $complex-nested-conditionals
    (block
      (if (i32.const 1)
        (then
          (block
            (if (i32.const 0)
              (then
                (unreachable)
                (i32.const 0))
              (else
                (block
                  (unreachable)
                  (i32.const 1))))))
        (else
          (unreachable)
          (i32.const 2)))
      (i32.const 3))
  ))
  "type mismatch"
)