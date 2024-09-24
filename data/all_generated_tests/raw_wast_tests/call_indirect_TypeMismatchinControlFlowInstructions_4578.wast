;; 7. **Switch Case Type Mismatch**:     - Implement a `switch-case` like structure using `br_table`, ensuring that one case has a `call_indirect` with a type mismatch.     - **Constraint**: All branches must respect the expected types.     - **Test Relation**: Validates trapping behavior in complex control structures.

(assert_invalid
  (module
    (func $f (param i32))
    (type $sig_correct (func (param i32)))
    (type $sig_incorrect (func (param f32)))
    (table funcref (elem $f))
    (func (param i32)
      (block
        (br_table 0 1 (local.get 0)
          (call_indirect (type $sig_correct) (i32.const 0) (i32.const 0))
        )
        (call_indirect (type $sig_incorrect) (i32.const 0) (f32.const 0.0))
      )
    )
  )
  "type mismatch"
)