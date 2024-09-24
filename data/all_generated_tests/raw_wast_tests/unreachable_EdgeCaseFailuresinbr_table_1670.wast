;; 1. **Test 1:** Create a function using `br_table` with a single target and insert `unreachable` right before it. Verify if the engine traps correctly when `unreachable` is executed.

(assert_invalid
  (module (func $test_br_table_single_target_unreachable
    (block
      (block
        (unreachable)
        (br_table 0 (i32.const 1))
      )
      (drop)
    )
  ))
  "type mismatch"
)