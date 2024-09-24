;; 4. Construct an `if` block that conditionally performs a `call_indirect` to a function in the module's table. Ensure that the control flow correctly transitions back from the imported function to the host function without stack corruption.

(assert_invalid
  (module
    (table $table 1 funcref)
    (type $sig (func (param i32) (result i32)))
    (func $target (type $sig)
      (param i32) (result i32)
      (i32.const 42)
    )
    (elem (i32.const 0) $target)
    (func $type-if-call-indirect
      (param i32) (result i32)
      (local.get 0)
      (if (result i32)
        (i32.const 0)
        (then 
          (i32.const 1)
          (call_indirect (type $sig) (i32.const 0))
        )
      )
    )
  )
  "type mismatch"
)