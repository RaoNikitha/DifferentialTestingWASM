;; Construct a block encapsulating a large sequence of mixed valid and invalid calls to functions with different return types, with `call`, `call_indirect`, conditional calls within nested blocks, to test if both implementations manage and validate function return types, indices, and stack consistency correctly throughout intricate nested block executions.

(assert_invalid
  (module
    (type $sig1 (func (result i32)))
    (type $sig2 (func (param i32) (result i64)))
    (func $func1 (result i32) (i32.const 0))
    (func $func2 (param i32) (result i64) (i64.const 10))
    (table funcref (elem $func1 $func2))
    (func
      (block (result i32)
        (call 0)
        (block (result i64)
          (call 1 (i32.const 5))
          (br 1))
        (call_indirect (type $sig2) (i32.const 1) (i32.const 3))
      )
    )
  )
  "type mismatch"
)