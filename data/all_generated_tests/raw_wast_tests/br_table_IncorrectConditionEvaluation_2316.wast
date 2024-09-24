;; 6. Test a `br_table` within an `if`-else construct where the operand points to different branches for `if` and `else`. Ensure that the branch goes correctly to the targeted labels based on the condition and not the default.

(assert_invalid
  (module
    (func $nested-if-else-br_table
      (local i32)
      (block
        (block
          (br_table 0 1 0 (i32.const 0))
        )
        (i32.const 2) (set_local 0)
        (i32.const 1)
        (if (result i32)
          (then (br_table 1 1 0 (i32.const 1)))
          (else (br_table 0 0 1 (i32.const 0)))
        )
      )
      (i32.eqz) (drop)
    )
  )
  "type mismatch"
)