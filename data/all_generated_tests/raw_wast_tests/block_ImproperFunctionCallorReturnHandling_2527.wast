;; 8. **Table Lookup on `call_indirect`**:    - **Description**: Create a block with a `call_indirect` instruction utilizing a table with mismatching entries. Check if the block handles the incorrect lookup and errors are propagated correctly.    - **Constraint**: Verify `call_indirect` against properly filled function tables.    - **Improper Handling**: Incorrect table lookup may result in the wrong function being executed or an invalid entry being accessed.

(assert_invalid
  (module
    (table 1 funcref)
    (type $t (func (result i32)))
    (func $f (block (call_indirect (type $t) (i32.const 0) (i32.const 1))))
  )
  "type mismatch"
)