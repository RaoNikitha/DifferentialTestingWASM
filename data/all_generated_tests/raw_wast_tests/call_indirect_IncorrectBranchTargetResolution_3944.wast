;; 3. Execute a `call_indirect` within a block enclosing nested blocks with `br_if` instructions. An incorrect branch resolution should lead to the `call_indirect` pointing to an invalid table entry, causing a type mismatch trap.

(assert_invalid
  (module
    (type (func (param i32) (result i32)))
    (func (result i32)
      (block 
        (block 
          (block
            (br_if 0 (i32.const 0))
            (call_indirect (type 0) (i32.const 1) (i32.const 42))
          )
        )
      )
    )
    (table 0 funcref)
  )
  "type mismatch"
)