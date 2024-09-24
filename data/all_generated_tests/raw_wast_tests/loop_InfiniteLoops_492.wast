;; Test 3: Implement a loop that uses a `br_table` with an out-of-bounds index to test if the default target is a valid fallback and does not lead to infinite looping.

(assert_invalid
  (module
    (func $loop_br_table_default_fallback
      (loop $loop_label (result i32)
        (i32.const 0)
        (br_table 1 (unreachable) (i32.const 0))
        (br $loop_label)
      )
    )
  )
  "type mismatch"
)