;; 9. **Test 9**:    - Validate an indirect call in the presence of multiple tables where the `call_indirect` uses a valid type with the loop. Improper chaining of loop exits through `br` instructions should result in infinite loops if misconfigured.    - **Constraint Checked**: Ensures that multiple tables and complex loop exit chaining are handled correctly to prevent infinite loops in multiple context scenarios.

(assert_invalid
  (module
    (type (func (param i32)))
    (type (func (param i32 i32)))
    (table funcref (elem (ref.func 0)))
    (func (param i32)
      (loop $outer
        (block $exit
          (call_indirect (type 1) (i32.const 0) (i32.const 1))
          (br $outer)
        )
      )
    )
  )
  "type mismatch"
)