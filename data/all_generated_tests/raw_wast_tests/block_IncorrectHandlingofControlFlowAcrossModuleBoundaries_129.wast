;; 10. Export a function that initializes a `block` with multiple value types and lengthy instruction lists. Invoke this function from another module to test if the operand stack and control flow are maintained correctly during extensive cross-module interactions.

(assert_invalid
  (module
    (func $complex-block-test
      (export "complex_block")
      (result i32 i32)
      (block (result i32 i32)
        (i32.const 1)
        (i32.const 2)
        (i32.add)
        (br 0 (i32.const 3) (i32.const 4))
        (i32.const 5)
        (i32.const 6)
      )
    )
  )
  "type mismatch"
)