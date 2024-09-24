;; 2. Insert `unreachable` within a conditional block (`if` block) and verify if the block’s alternate branch executes without issues. Ensure that control flow outside the `if` structure remains unaffected.    - **Constraint:** Confirm that the `unreachable` instruction correctly interrupts the active block without affecting other branches.    - **CFG Check:** Ensure that conditional branches are properly managed in the presence of `unreachable`.

(assert_invalid
  (module (func $type-unreachable-in-if-else
    (if (i32.const 1)
      (then (unreachable))
      (else (i32.const 0))
    )
  ))
  "type mismatch"
)