;; 6. Test for branching scenarios where a `br_table` instruction within a loop contains indices pointing to types that do not match the loop's expected result type. This tests how branching tables handle type consistency within loops.

(assert_invalid
  (module
    (func $loop-with-br_table (result i32)
      (block (result i32)
        (loop (result i32)
          (i32.const 0) ;; branch condition
          (br_table 1 0 (i32.const 1))
        )
      )
    )
  )
  "type mismatch"
)