;; 1. **Unreachable Code after `br_table` with Invalid Target Index:**    Test a `br_table` instruction that targets an index out of the bounds of the label vector. Ensure that execution correctly branches to the default label and subsequent code is marked as unreachable. This checks if the CFG correctly identifies out-of-bound branches.

(assert_invalid
  (module
    (func $unreachable-code-after-br_table
      (block (br_table 0 0 1 (i32.const 2)))
      (unreachable)
    )
  )
  "unknown label"
)