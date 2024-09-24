;; 4. **Test Description:** Construct a loop which uses nested `br_table` instructions with varying label arity. Inspect if `wizard_engine` consistently reports `BrTableArityMismatch` when the arity is mismatched, potentially causing side-effects leading to loops not terminating.

(assert_invalid
  (module
    (func
      (loop (result i32)
        (block (result i64)
          (block (result i32)
            (br_table 0 1 (i32.const 0) (i32.const 0))
            (br_table 0 1 (i32.const 1) (i32.const 0))
          )
        )
      )
    )
  )
  "type mismatch"
)