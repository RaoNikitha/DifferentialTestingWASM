;; - **Test 7**: Craft a loop that populates the stack with varying data types (`i32`, `i64`, `f32`, `f64`). Perform several backward branches with operand consumption and production, testing if the stack's type consistency is maintained without any type corruption.

(assert_invalid
  (module (func $varying-stack-types
    (result i32)
    (loop (result i32)
      i32.const 42
      i64.const 84
      f32.const 1.5
      f64.const 3.14
      br 0
    )
  ))
  "type mismatch"
)