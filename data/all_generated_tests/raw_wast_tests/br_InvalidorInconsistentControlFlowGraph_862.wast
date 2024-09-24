;; 3. **Branching to an Unknown Label:**    - Implement a `br` instruction referencing an undefined label within a nested structure.    - **Constraint Checked:** Label validity.    - **CFG Impact:** Jumping to an unknown label disrupts the CFG by potentially introducing non-existent paths, marking valid paths as unreachable.

(assert_invalid
  (module (func $test (block (block (br 2)))))
  "unknown label"
)