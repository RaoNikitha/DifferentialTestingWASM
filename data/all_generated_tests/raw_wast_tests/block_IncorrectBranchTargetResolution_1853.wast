;; Set up a complex structure with multiple blocks and nested loops. Insert a `br_table` instruction within one of the loops to branch to different blocks based on a dynamic condition. This test checks the correct resolution of branch targets within a complex control flow.

(assert_invalid
  (module
    (func $complex-test (result i32)
      (block (result i32)
        (loop (result i32)
          (block (result i32)
            (i32.const 0)
            (i32.const 1)
            (br_table 0 1 2)
          )
          (i32.const 2)
          (br 1)
        )
      )
    )
  )
  "type mismatch"
)