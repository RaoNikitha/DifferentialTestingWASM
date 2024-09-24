;; 4. **Unreachable After Indirect Branch**:    Use `br_table` in a loop that can select a branch with an index indirectly leading to an `unreachable` instruction. This tests if indirect branching coupled with improper context extension causes reaching `unreachable`.

(assert_invalid
  (module (func $unreachable_after_indirect_branch
    (loop
      (block (br_table 0 0 1 (i32.const 1)) (unreachable))
    )
  ))
  "unreachable executed due to indirect branch"
)