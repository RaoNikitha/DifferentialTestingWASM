;; 1. **Test 1: Table Out-of-Bounds Index**:    - **Description**: Create a WebAssembly module that uses `call_indirect` with an index operand beyond the length of the defined table.    - **Constraint Checked**: Ensures proper trapping behavior for invalid table indexing.    - **CFG Relation**: Tests the CFG's handling of out-of-bounds access, expecting a trap to demonstrate correct edge case handling.

(assert_invalid
  (module
    (type (func (param i32)))
    (table 1 funcref)
    (func $type-out-of-bounds
      (call_indirect (type 0) (i32.const 1) (i32.const 42))
    )
  )
  "out of bounds table index"
)