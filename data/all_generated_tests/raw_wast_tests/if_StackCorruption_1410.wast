;; 1. Conditional with Mismatched Block Types: Test an `if` instruction where the `blocktype` specifies a return type that is not produced in one branch. ```wasm // Example (if (result i32)   (then i32.const 10)   (else) ) ``` *Reasoning*: This checks if one implementation correctly handles the stack when the `else` branch does not provide the expected type, potentially revealing stack imbalances or stack underflow.

(assert_invalid
  (module (func $conditional-mismatched-block-types (result i32)
    (if (result i32) (i32.const 1) (then (i32.const 10)) (else))
  ))
  "type mismatch"
)