;; - Test a function with nested blocks where the return instruction is expected to end the outermost function but incorrectly targets an inner block. Verify if the function exits correctly or continues execution within the inner block.

(assert_invalid
  (module
    (func $nested-blocks (result i32)
      (i32.const 42)
      (block (result i32)
        (loop (result i32)
          (br 1 (i32.const 99))
          (return)
        )
        (return (i32.const 84))
      )
    )
  )
  "type mismatch"
)