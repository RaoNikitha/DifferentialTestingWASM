;; 2. **Test Description**:     Design a test with multiple nested loops where each loop includes a `call_indirect` instruction that references functions with varying signatures. Inside the loops, use a `br_table` to jump between block depths.    **Constraint**: Ensure that the loops' depth management is handled correctly, with the `call_indirect` references resolving without type mismatches.    **Relation to Mismanagement of Block Nesting**: Validates that `call_indirect` within nested loops does not cause incorrect block exits or type mismatches due to improper depth management.

(assert_invalid
  (module
    (type $sig1 (func (param i32) (result i32)))
    (type $sig2 (func (param i32 i32) (result i32)))
    (func $f1 (param i32) (result i32) (i32.const 0))
    (func $f2 (param i32 i32) (result i32) (i32.const 1))
    (table funcref (elem $f1 $f2))
    (func (param i32)
      (loop (param i32)
        (block $outer
          (loop $inner (param i32)
            (block $exit
              (br_table $outer $inner (local.get 0))
              (call_indirect (type $sig1) (i32.const 0) (i32.const 1))
            )
            (call_indirect (type $sig2) (i32.const 1) (i32.const 2) (i32.const 0))
          )
        )
      )
    )
  )
  "type mismatch"
)