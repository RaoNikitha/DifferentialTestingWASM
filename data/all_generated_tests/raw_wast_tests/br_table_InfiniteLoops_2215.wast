;; 5. **Multiple Branches to Same Target**:    - Implement a `br_table` where multiple different operand indices branch to the exact same label, all within a loop. Make sure the engine doesn't mistakenly stay within the loop without breaking out on correct conditions being met.

(assert_invalid
  (module (func $multiple-branches-same-target
    (loop $loop
      (block (br_table $loop $loop $default (i32.const 2)))
      (block $default (i32.const 0))
    )
  ))
  "type mismatch"
)