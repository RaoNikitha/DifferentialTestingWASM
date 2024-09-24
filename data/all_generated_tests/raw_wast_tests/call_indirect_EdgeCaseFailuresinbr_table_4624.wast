;; 3. **Function Type Mismatch**:    Create a test with a `call_indirect` instruction referencing a function type that does not match the dynamically resolved function type in the table. This checks if the implementations handle type mismatches correctly. Likewise, `br_table` relies on correct type handling to prevent misrouting of execution paths.

(assert_invalid
  (module
    (type $t0 (func (param i32)))
    (type $t1 (func (param i32) (result i32)))
    (table funcref (elem $f))
    (func $f (param i32))
    (func (result i32)
      (call_indirect (type $t1) (i32.const 0) (i32.const 42))
    )
  )
  "type mismatch"
)