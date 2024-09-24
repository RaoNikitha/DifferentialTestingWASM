;; 2. **Test Description:** Implement a `br_table` within a `loop` nested inside an `if` block inside a `function`. Verify that the selected label inside the `br_table` instruction correctly re-enters the loop rather than incorrectly branching to the `if` block or function end.

(assert_invalid
  (module (func $nested-br_table-validation
    (block
      (i32.const 0)
      (if (then 
        (loop 
          (block 
            (i32.const 0) 
            (br_table 0 1)
          )
        )
      ))
    )
  ))
  "unknown label"
)