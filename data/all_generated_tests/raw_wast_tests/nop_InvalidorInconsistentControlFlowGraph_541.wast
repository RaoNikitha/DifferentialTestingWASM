;; 2. **Test Description**:    - Define a function containing a `loop` with several `nop` instructions before an `end`. Observe any differential behavior in loop execution and validation.    - **Constraint Checked**: Correct loop structure validation and proper execution behavior without CFG corruption.    - **Relation to CFG**: Verifies the integrity of loop constructs in the CFG with `nop` instructions simply being ignored.

(assert_invalid
  (module
    (func $test-loop-nop
      (loop
        nop
        nop
        nop
      end)
    )
  )
  "type mismatch"
)