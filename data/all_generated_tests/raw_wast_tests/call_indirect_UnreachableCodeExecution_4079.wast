;; Create a deliberate failure scenario by invoking a function through `call_indirect` that requires more operands than provided on the stack, ensuring stack underflow appropriately triggers an `unreachable` trap.

(assert_invalid
  (module
    (type (func (param i32 i32)))
    (table 1 funcref)
    (elem (i32.const 0) func $func)
    (func $func (param i32 i32))
    (func $test
      (call_indirect (type 0) (i32.const 0) (i32.const 42))
    )
  )
  "stack underflow"
)