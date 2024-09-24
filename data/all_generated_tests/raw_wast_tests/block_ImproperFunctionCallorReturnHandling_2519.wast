;; Design a block that includes conditional branching (`br_if`) to a `call_indirect` based on a prior function result, ensuring that mismanagement in operand stack during conditional execution paths can be detected, particularly when dealing with incorrect return values or state expectations.

(assert_invalid
  (module 
    (type $sig (func (result i32)))
    (table 1 funcref)
    (elem (i32.const 0) $type-value-empty-vs-i32)
    (func $test (param i32) (result i32)
      (block $outer (result i32)
        (block $inner (result i32)
          (br_if 1 (call_indirect (type $sig) (i32.const 0) (i32.const 1)))
          (i32.const 2)
        )
        (i32.const 3)
      )
    )
  )
  "type mismatch"
)