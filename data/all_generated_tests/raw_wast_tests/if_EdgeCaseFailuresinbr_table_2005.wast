;; 6. **Test 6**: Using an `if` with mismatched `blocktype` for `then` and `else` branches that both contain `br_table`, ensuring `br_table` doesn't incorrectly propagate mismatched types.

(assert_invalid
  (module
    (func $mismatch-blocktype (result i32)
      (block (if (result i32) (i32.const 1)
        (then (block (br_table 0 0) (i32.const 1)))
        (else (block (br_table 0) (i64.const 0)))
      ))
    )
  )
  "type mismatch"
)