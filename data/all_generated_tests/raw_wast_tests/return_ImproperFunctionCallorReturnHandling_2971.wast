;; 10. Test a chain of indirect function calls where one function calls another using `call_indirect` and returns. Validate the operand stack consistency and type checking post-call in both WebAssembly and Wizard Engine to uncover mishandling in type validation and return sequence.

(assert_invalid
  (module
    (table 10 funcref)
    (type $sig (func))
    (type $ret-i32 (func (result i32)))
    (func $callee (type $ret-i32) (i32.const 42) (return))
    (func $caller (result i32)
      (i32.const 0)
      (call_indirect (type $ret-i32) (return))
    )
  )
  "type mismatch"
)