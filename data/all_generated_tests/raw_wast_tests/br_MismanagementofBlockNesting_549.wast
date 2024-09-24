;; 10. **Skipping Nested Structures:**    Implement a scenario where a `br` instruction should cause the control flow to skip over multiple nested control structures (like several levels of blocks and loops) to an outer non-immediate block. Check for errors in the flow where it skips beyond the intended target structure.

(assert_invalid
  (module (func $nested-structure-skip
    (block (block (loop (block (br 3))))))
  )
  "unknown label"
)