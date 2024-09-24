;; 8. **Test 8**: A `br_table` inside an `if` with true condition, with an index the same as the smallest valid target (index 0), ensuring the normal case returns correct results.

(assert_invalid
  (module (func
    (if (i32.const 1)
        (then (br_table 0 (block (nop))))
        (else)
    )
  ))
  "mismatched block type"
)