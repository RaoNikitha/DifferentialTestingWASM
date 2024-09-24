;; 10. Develop a test case where a `br_table` instruction is nested within a set of indirectly called functions (`call_indirect`). Push the index to `br_table` from the stack and verify if WebAssembly's direct stack operations align properly compared to the split signature handling in Wizard_engine, especially in nested calls.

(assert_invalid
  (module
    (func $f0 (param i32) (result i32)
      (local i32)
      (block (result i32)
        (call_indirect (type $sig0) (local.get 0) (i32.const 1))
      )
      (block (result i32)
        (br_table 0 1 (local.get 0))
      )
    )
    (type $sig0 (func (param i32) (result i32)))
    (table funcref (elem $f0))
  )
  "type mismatch"
)