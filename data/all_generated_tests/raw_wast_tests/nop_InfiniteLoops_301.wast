;; 2. **Test with Nested Loops and Nop Instructions**:    - Create nested loops where each loop body contains only `nop` instructions. This will test if `wizard_engine` properly initializes nested validation contexts, ensuring no infinite loops occur.    - Constraint: Nested loops should not loop indefinitely as `nop` does not alter control flow or stack state.

(assert_invalid
  (module
    (func $nested-loops
      (loop $outer
        (loop $inner
          nop
          (br $inner)
        )
        nop
        (br $outer)
      )
    )
  )
  "unexpected end of section or function")