;; 10. Build a `br_table` instruction nested within several levels of blocks and loops, targeting a label in an outer ‘if’ block, to confirm that the operand correctly directs the control flow through and out of the appropriate nested constructs, verifying correct flow control amidst complex nesting. ```

(assert_invalid
  (module
    (func $nested_br_table
      (block
        (loop
          (block 
            (loop
              (if 
                (i32.const 1)
                (then (br_table 0 1 2)))
              (br 3)
            )
          )
        )
      )
    )
  )
  "unknown label"
)