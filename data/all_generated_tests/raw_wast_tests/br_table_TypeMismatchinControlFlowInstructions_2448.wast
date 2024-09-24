;; 8. **Backwards Branch to Incorrectly Typed Block:**    Implement `br_table` within a backward `loop` where the loop block expects one type but the `br_table` targets a label with a different type upon the backward branch. This verifies type consistency in backward loop branches.

(assert_invalid
  (module
    (func $backward-branch-type-mismatch
      (i32.const 0)
      (loop (result f32)
        (block (result i32)
          (br_table 0 (i32.const 1))
        )
      )
    )
  )
  "type mismatch"
)