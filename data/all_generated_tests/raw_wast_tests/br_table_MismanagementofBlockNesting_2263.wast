;; 3. Create a `br_table` inside a nested `if` statement nested within a block, where the operand index branches to a label outside both the `if` and the block. This assesses whether branching targets are correctly calculated across nested conditional branches and blocks.

(assert_invalid
  (module
    (func $nested-br-if
      (block
        (i32.const 1)
        (if
          (then
            (br_table 0 1 1 (i32.const 0))
          )
        )
      )
    )
  )
  "unknown label"
)