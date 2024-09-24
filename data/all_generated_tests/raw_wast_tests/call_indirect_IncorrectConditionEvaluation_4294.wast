;; 3. Verify if the `call_indirect` instruction correctly traps when the table index (`tableidx`) is out of the valid bounds, evaluating how both implementations handle boundary conditions.

(assert_invalid
  (module
    (type (func (param i32) (result i32)))
    (table 1 funcref)
    (elem (i32.const 0) 0)
    (func (result i32)
      (call_indirect (type 0) (i32.const 1))
    )
  )
  "out of bounds table index"
)