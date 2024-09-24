;; 4. **Equal Target Arity Enforcement**    - Construct a `br_table` with labels that have the same arity but make the default label have a different arity. This tests if the implementation validates the arity consistency across all provided labels.

(assert_invalid
  (module (func $unequal-arity-labels
    (block (result i32)
      (block (result f32)
        (block (result i64)
          (br_table 0 1 2 (i32.const 0))
        )
      )
    )
  ))
  "type mismatch"
)