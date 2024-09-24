;; Test 10: Develop a function with a combination of `br_if` and `br_table` in mixed sequential and nested constructs, ensuring that all conditional and table-based branches respect the structured control flow rules without misdirected jumps. The test validates consistent control flow adherence under mixed conditional instructions.

(assert_invalid
  (module
    (func
      (block
        (br_if 0 (i32.const 0))
        (block (result i32)
          (br_table 0 0 0 (i32.const 1))
          (i32.const 0)
        )
        (drop)
      )
    )
  )
  "type mismatch"
)