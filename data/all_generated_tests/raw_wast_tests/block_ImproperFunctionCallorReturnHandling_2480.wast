;; Test a block containing a valid `call_indirect` instruction with a matching function type but an out-of-bounds table index to see if different implementations correctly handle the type-right but index-wrong scenario by either throwing an error or proceeding incorrectly. The block should be followed by an `end` instruction.

(assert_invalid
  (module
    (table 1 1 funcref)
    (type $sig (func (param i32) (result i32)))
    (func (result i32)
      (block (result i32) 
        (call_indirect (type $sig) (i32.const 1) (i32.const 0))
      )
    )
  )
  "out of bounds table access"
)