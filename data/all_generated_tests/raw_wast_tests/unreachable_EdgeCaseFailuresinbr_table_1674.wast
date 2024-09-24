;; 5. **Test 5:** Combine `br_table` with `if-else` control structures. Add `unreachable` within the `if` block and after the `else` block, observing if traps occur correctly without evaluating `br_table` targets.

(assert_invalid
  (module (func $br_table-if-else-with-unreachable
    (block
      (br_table 0 (i32.const 0))
      (if (i32.const 1)
        (then (unreachable))
        (else (unreachable))
      )
    )
  ))
  "type mismatch"
)