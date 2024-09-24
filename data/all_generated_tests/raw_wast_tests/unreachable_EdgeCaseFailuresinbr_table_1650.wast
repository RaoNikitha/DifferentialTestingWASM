;; 1. **Test 1: Unreachable in Target-exceeding `br_table`**    - A function contains a `br_table` instruction with an index exceeding the number of targets, followed by an `unreachable` instruction in an out-of-bounds target.    - **Reasoning:** Tests if `unreachable` correctly traps when the `br_table` index is out of bounds.    - **Constraint:** Checks if both environments handle out-of-bounds `br_table` index leading to an `unreachable` trap consistently.

(assert_invalid
  (module
    (func $test (block $label (block $label1
      (br_table $label $label1 2) (unreachable)
    )
    (unreachable)
  ))
  "out of bounds br_table index"
)