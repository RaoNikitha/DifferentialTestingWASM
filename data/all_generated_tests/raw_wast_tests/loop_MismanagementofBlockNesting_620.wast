;; 1. **Nested Loop with Multiple Branches**: Create a test with a two-level nested loop, where the inner loop has multiple branching instructions (`br`, `br_if`, and `br_table`) that reference both the inner and outer loops. This test checks if the `br_table` instruction correctly interprets the loop's depth and manages nested structures without exiting the wrong loop.

(assert_invalid
  (module
    (func $nested-loop-with-multiple-branches
      (i32.const 5)
      (loop (result i32)
        (loop
          br_if 1 (i32.const 1)
          br 0
          br_table 0 1 (i32.const 0)
        )
        (i32.const 1)
      )
    )
  )
  "type mismatch"
)