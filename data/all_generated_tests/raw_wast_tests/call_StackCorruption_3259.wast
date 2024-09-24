;; **Test 8**: Invoke a call instruction with indirect function indexing via a table. - **Constraint Checked**: Indirect call index bounds and type checks. - **Stack Corruption Risk**: Indexing table functions directly in wizard_engine could bypass type checks, leading to calling unintended functions and stack corruption.

(assert_invalid
  (module
    (type $sig (func (param i32) (result i32)))
    (table 2 funcref)
    (elem (i32.const 0) $f)
    (func $f (param i32) (result i32) (i32.const 42))
    (func (result i32)
      (call_indirect (type $sig) (i32.const 100) (i32.const 1))
    )
  )
  "type mismatch"
)