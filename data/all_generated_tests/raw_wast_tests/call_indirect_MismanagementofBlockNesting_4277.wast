;; 6. **Br_table misinterpretation with call_indirect in complex nested blocks**:    - **Description**: Design a nested block structure where a `br_table` instruction could potentially cause a misinterpretation of the block depth affecting subsequent `call_indirect` execution.    - **Expected outcome**: Ensure both implementations correctly manage the control flow and cause the indirect call to successfully execute or trap due to block mismanagement.

(assert_invalid
  (module
    (type $sig (func (param i32)))
    (func $f (param i32))
    (table funcref (elem $f))
    (func $nested-blocks
      (block
        (loop
          (br_table 0 0 0
            (call_indirect (type $sig) (i32.const 0))
          )
        )
      )
    )
  )
  "type mismatch"
)