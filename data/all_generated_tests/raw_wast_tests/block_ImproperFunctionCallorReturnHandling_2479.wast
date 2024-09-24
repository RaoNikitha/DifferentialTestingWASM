;; 10. **Test 10**: Create a sequence of `block` instructions, each calling functions that modify the expected state of the operand stack in conflicting ways. This aims to test the robustness of operand stack conformity and the ability of implementations to handle complex sequences of function calls within nested blocks.

(assert_invalid
  (module
    (func $complex-nested-blocks (result i32)
      (block (result i32)
        (block (result i32)
          (block (result i64)
            (call $modify-stack) 
            (br 0 (i32.const 5))
          )
          (br 1 (i32.const 6))
        )
        (block (result i32)
          (call $modify-stack-again)
          (br 0 (i32.const 7))
        )
      )
    )
    (func $modify-stack (i64.const 0))
    (func $modify-stack-again (i32.const 0))
  )
  "type mismatch"
)