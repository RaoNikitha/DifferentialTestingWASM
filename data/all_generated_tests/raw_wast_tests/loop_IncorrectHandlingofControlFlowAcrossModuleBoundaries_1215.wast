;; 6. A complex `loop` that includes `br_if` branching to the start of the loop while conditionally calling an imported function. This tests if the branching logic and operand stack are correctly restored and maintained.

(assert_invalid
  (module
    (import "" "" (func $imported (result i32)))
    (func $test
      (i32.const 1)
      (loop (result i32)
        (call $imported)
        (br_if 0 (i32.const 1))
      )
    )
  )
  "type mismatch"
)