;; 9. **Test Description**:    - Design a complex multi-level `loop` with various `break` conditions and place `nop` within each level. Validate loop control and break resolution.    - **Constraint Checked**: Correct loop control and break behavior regardless of `nop` presence.    - **Relation to CFG**: Ensures that nested loops and break conditions in CFG are managed without errors due to `nop`.

(assert_invalid
  (module
    (func $nested-loops-break (result i32)
      (block $outer
        (loop $inner
          nop
          br $outer
          nop
          (loop $inner-inner
            nop
            br $inner
          )
        )
      )
      i32.const 0
    )
  )
  "type mismatch"
)