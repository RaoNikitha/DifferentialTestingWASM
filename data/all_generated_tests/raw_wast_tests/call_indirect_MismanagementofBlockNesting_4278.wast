;; 7. **Function signature checking in a switch-like structure of blocks**:    - **Description**: Emulate a switch structure using nested blocks with varying function signature checks for calls resolved indirectly within case-like segments.    - **Expected outcome**: Verify that function signature checks are accurate within all nested segments and only mismatched cases trigger traps.

(assert_invalid
  (module
    (type $t1 (func (param i32) (result i32)))
    (type $t2 (func (param i64) (result i32)))
    (table 2 funcref)
    (elem (i32.const 0) 0 1)
    (func $f1 (type $t1) (i32.const 1))
    (func $f2 (type $t2) (i64.const 1) (i32.const 1))
    (func (block 
      (block 
        (block 
          (block 
            (call_indirect (type 0) (i32.const 0) (i32.const 1))
          )
          (call_indirect (type 0) (i32.const 1) (i64.const 1))  
        )
      )
    ))
  )
  "type mismatch"
)