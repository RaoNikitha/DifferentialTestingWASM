;; 8. **Test Description**: Embed `nop` within deeply nested `loop` constructs and validate normal loop exit conditions are met.    **Constraint Checked**: `nop` doesn’t affect the nested loop termination.    **Relation to CFG**: Ensures complex loop control flows don’t misinterpret `nops` as affecting loop conditions.

(assert_invalid
  (module
    (func
      (loop $outer
        (loop $inner
          nop
          br $inner
        )
        br $outer
      )
    )
  )
  "type mismatch"
)