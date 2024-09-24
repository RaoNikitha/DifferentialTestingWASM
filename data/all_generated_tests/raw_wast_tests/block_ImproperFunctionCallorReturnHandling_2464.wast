;; - Test 5: Implement a block that initiates with a `call` to a function with multiple return values, but the blocktype specifies fewer or different return types. This determines if the implementation can accurately check and manage multiple return values.

(assert_invalid
  (module
    (func $multi-returns (result i32 i32) (i32.const 1) (i32.const 2))
    (func $type-mismatch-returns (result i32)
      (block (result i32) (call $multi-returns))
    )
  )
  "type mismatch"
)