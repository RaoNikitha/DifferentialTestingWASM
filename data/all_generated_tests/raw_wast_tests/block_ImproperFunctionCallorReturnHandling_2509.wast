;; 10. Test Description: Develop a test where a block has an early return with a subsequent function call inside the block. The return type expected by the block should differ from the function’s final return type. WebAssembly would catch this through iterative `check_block` operations, while `wizard_engine` might ignore nested return handling, leading to inconsistent executions.

(assert_invalid
  (module (func $test-block-early-return
    (block (result i32)
      (return (i32.const 42))
      (call $dummy)
    )
    (i32.const 0)
  ))
  "type mismatch"
)