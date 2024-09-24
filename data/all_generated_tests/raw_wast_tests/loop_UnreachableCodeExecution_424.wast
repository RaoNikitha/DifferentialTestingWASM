;; 5. **Test Description 5**: Develop a loop with a `br_table` instruction branching to multiple labels within the loop, some leading to normal code and others leading to `unreachable`. Verify if any implementation mistake in indirect branch handling causes the code to reach `unreachable` due to incorrect index resolution.

(assert_invalid
  (module
    (func $br_table_loop_test
      (loop $lbl (result i32)
        (i32.const 0)
        (br_table $lbl1 $lbl2 $lbl3 (i32.const 1))
        (br $lbl)
        unreachable
        $lbl1 (i32.const 42)
        (br $lbl)
        $lbl2 (i32.const 99)
        (br $lbl)
        $lbl3 unreachable
        drop
      )
    )
  )
  "type mismatch"
)