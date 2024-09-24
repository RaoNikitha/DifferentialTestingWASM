;; Test 3: Use a large loop with multiple `br_if` statements that rely on dynamic conditions evaluated from the operand stack. Ensure the primary block type expects an `i32` result, and test if WebAssembly handles dynamic evaluations correctly while `wizard_engine` mishandles branches leading to infinite execution.

(assert_invalid
  (module
    (func $test-loop-br-if (result i32)
      (block (result i32)
        (loop (result i32)
          (br_if 0 (i32.const 1) (i32.const 0))
          (br 1 (i32.const 2))
        )
      )
    )
  )
  "type mismatch"
)