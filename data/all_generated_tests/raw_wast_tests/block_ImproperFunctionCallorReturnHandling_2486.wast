;; Test a block that starts with a `call` to a function that returns a value and continues with an invalid type by casting another value on the stack, leading to a type mismatch when returning from the block. This verifies type check propagation through function calls inside blocks.

(assert_invalid
  (module
    (type $t (func (result i32)))
    (func $f (result i32) (i32.const 42))
    (func $test (result i32)
      (block (result i32)
        (call $f)
        (i64.const 10)
      )
    )
  )
  "type mismatch"
)