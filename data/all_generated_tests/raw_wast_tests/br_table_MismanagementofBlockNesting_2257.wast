;; Test7: Implement multiple nested `if` conditions where a `br_table` incorrectly branches to labels in another `if` block. Expect `wizard_engine` to raise a mismatch error, compared to WebAssembly that might continue execution, leading to incorrect control flow and potential traps.

(assert_invalid
  (module
    (func $nested-if-branch
      (block
        (i32.const 0) (if (then
          (i32.const 1) (if (then
            (br_table 0 1 2)
          ))
        ))
      )
    )
  )
  "unknown label"
)