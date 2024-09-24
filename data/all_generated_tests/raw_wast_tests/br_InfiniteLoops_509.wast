;; 10. **Test Description:**     - Develop a loop scenario where a `br` instruction attempts to branch to a target label in another loop's context, potentially violating the structure.     - **Constraint Checking:** Ensures that the implementation forbids improper cross-context branching between loops.     - **Relation to Infinite Loops:** Improper cross-context branching can disrupt control flow, leading to infinite looping conditions.

(assert_invalid
  (module (func $cross-context-loop
    (loop (block (br 1)))
    (loop (block (br 1)))
  ))
  "unknown label"
)