;; 5. **Test for Underflow Condition in `br_table` Followed by Stack-consuming `call_indirect`**:    - Setup `br_table` where the target index might cause stack underflow, then execute `call_indirect` requiring specific arguments from the stack.    - Constraint: Stack underflow during `br_table`.    - Relation: Evaluates stack management and resilience to underflow when using `call_indirect`.

(assert_invalid
  (module
    (type $sig (func (param i32) (result i32)))
    (table 1 funcref)
    (func $f (param i32) (result i32) (i32.const 0))
    (elem (i32.const 0) $f)
    (func $underflow-br-table
      (block
        (br_table 0 0 (i32.const 0))
        (call_indirect (type $sig) (i32.const 0))
      )
    )
  )
  "stack underflow"
)