;; 6. **Test 6: Branching on Indirect Call Results**:    - **Description**: Construct conditional branches based on the result of `call_indirect`, with varying function outcomes.    - **Constraint Checked**: Verifies accurate handling and propagation of function results through conditional branches.    - **CFG Relation**: Tests if the CFG correctly handles different branching paths resulting from `call_indirect` outcomes.

(assert_invalid
  (module
    (type (func (result i32)))
    (type (func (result i64)))
    (func $f (result i32) (i32.const 42))
    (func $g (result i64) (i64.const 84))
    (table funcref (elem $f $g))
    (func (result i32)
      (i32.eqz
        (call_indirect (type 0) (i32.const 1))
      )
      (call_indirect (type 0) (i32.const 0))
    )
  )
  "type mismatch"
)