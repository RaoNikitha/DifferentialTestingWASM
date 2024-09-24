;; 2. **Test Description**: Place a `nop` before a conditional branch instruction and check the flow diverges correctly based only on the condition.    **Constraint Checked**: `nop` doesn't impact branch condition evaluation.    **Relation to CFG**: Ensures no-op is truly inert in conditional paths.

(assert_malformed
  (module
    (func (local $cond i32)
      nop
      (if (local.get $cond)
        (then (nop)) 
        (else (nop))
      )
    )
  )
  "nop instruction before conditional branch"
)