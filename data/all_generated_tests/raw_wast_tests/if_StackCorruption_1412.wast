;; 3. Unconditional Trap Handling: Place `unreachable` in the `then` branch and verify how stack is managed. ```wasm // Example (if (result i32)   (then unreachable)   (else i32.const 30) ) ``` *Reasoning*: This checks proper handling of traps inside `if` blocks, ensuring the stack does not corrupt when the trap is triggered.

(assert_invalid
  (module
    (func $unreachable-trap (result i32)
      (if (result i32)
        (then unreachable)
        (else (i32.const 30))
      )
    )
  )
  "type mismatch"
)