;; 4. **Test 4**: A `br_table` instruction inside an `else` branch with an index equal to zero, but with no targets specified, to test behavior when the target list is empty.

(assert_invalid
  (module
    (func $test_br_table_empty_target
      (block (br_table 0 (i32.const 0)))
      (if (result i32) (then (i32.const 0)) (else (block (br_table 0))))
    )
  )
  "target list empty"
)