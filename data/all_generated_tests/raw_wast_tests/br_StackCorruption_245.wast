;; 6. **Test Description**: Create a situation with consecutive `block` structures, perform operations, and then utilize the `br` instruction from an inner `block` to an outer `block`. Check for consistency in operand stack unwinding and potential stack corruption.

(assert_invalid
  (module
    (func $type-stack-unwind (result i32)
      (block (result i32)
        (i32.const 42)
        (block
          (i32.const 0)
          (br 1)
          (i32.const 1)
        )
      )
    )
  )
  "type mismatch"
)