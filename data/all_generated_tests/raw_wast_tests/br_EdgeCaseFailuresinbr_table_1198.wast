;; 9. Examine a `br_table` instruction placed within a loop construct with varied indices, checking if the implementation correctly handles looping back versus moving forward or defaulting accurately. This tests loop-specific index handling.

(assert_invalid
  (module
    (func
      (block
        (loop (result i32)
          (br_table 0 1 2 (i32.const 1) (i32.const 2))
        )
      )
    )
  )
  "type mismatch"
)