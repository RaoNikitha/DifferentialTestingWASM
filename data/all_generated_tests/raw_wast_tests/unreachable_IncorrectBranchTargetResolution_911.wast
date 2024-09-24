;; 2. **Test Description:** Insert an `unreachable` instruction in a nested loop followed by a `br_if` instruction with a condition that never meets, ensuring the loop execution hits the `unreachable`.    - **Constraint Checked:** Validates if `unreachable` in nested loops interrupts the control flow correctly.    - **Incorrect Branch Target Relation:** Tests whether the branching properly evaluates conditions and correctly resolves the loop context.

(assert_invalid
  (module (func $unreachable-in-nested-loop-br_if
    (loop (loop (unreachable) (br_if 0 (i32.const 1))))
  ))
  "type mismatch"
)