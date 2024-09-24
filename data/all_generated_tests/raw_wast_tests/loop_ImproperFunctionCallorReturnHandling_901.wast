;; - Implement a `loop` with nested `call_indirect` instructions, ensuring the proper management of the operand stack and correct function signature validation. Check for invalid table index references and mismatched signatures.

(assert_invalid
  (module
    (type $sig (func (param i32) (result i32)))
    (table 1 funcref)
    (func $test
      (local i32)
      (loop
        (call_indirect (type $sig) (local.get 0) (i32.const 0))
      )
    )
  )
  "type mismatch"
)