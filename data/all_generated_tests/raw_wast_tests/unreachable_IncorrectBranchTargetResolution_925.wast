;; 6. **Test Description:** Embed `unreachable` followed by a `br` targeting a label defined by a surrounding `block` with nested `loop` constructs, ensuring correct label resolution amidst multiple nesting.    *Constraint Checked:* Accurate label targeting in heavily nested control structures.    *Relation to Incorrect Branch Target Resolution:* Verifies robustness of target resolution in intricate conditional constructs.

(assert_invalid
  (module (func $nested-unreachable-br
    (block (loop (block (unreachable) (br 2))))
  ))
  "type mismatch"
)