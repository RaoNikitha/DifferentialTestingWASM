;; 8. Operand Consumption Mismatch between Branches: Branches within an `if` instruction where the stack height is different. ```wasm // Example (local $var i32) (if   (then     local.get $var)    (else      i32.const 4      i32.const 2)) ``` *Reasoning*: Ensures that each branch operates on a consistent stack frame, revealing possible operand consumption issues.

(assert_invalid
  (module
    (func (local $var i32)
      (if (then local.get $var) (else i32.const 4 i32.const 2))
    )
  )
  "type mismatch"
)