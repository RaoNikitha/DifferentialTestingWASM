;; 9. Return Type Coherence: Check that return types between `then` and `else` branches match block type constraints. ```wasm // Example (if (result i32)    (then i32.const 42)    (else i64.const 42)) ``` *Reasoning*: Validates whether return type agreements are honored, preventing stack inconsistencies.

(assert_invalid
  (module (func $return-type-coherence
    (if (result i32)
        (then (i32.const 42))
        (else (i64.const 42))
    )
  ))
  "type mismatch"
)