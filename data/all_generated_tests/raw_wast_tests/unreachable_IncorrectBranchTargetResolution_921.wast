;; 2. **Test Description:** Insert `unreachable` within a nested loop, followed by a `br` instruction meant to exit to an outer block, verifying if the inner loop incorrectly changes the target resolution.    *Constraint Checked:* Correct outer block label resolution despite the presence of inner structures.    *Relation to Incorrect Branch Target Resolution:* Tests if the looping construct's label is resolved correctly with potential interference from `unreachable`.

(assert_invalid
  (module (func $type-nested-loop-with-unreachable
    (block (loop (unreachable) (br 1)))
  ))
  "type mismatch"
)