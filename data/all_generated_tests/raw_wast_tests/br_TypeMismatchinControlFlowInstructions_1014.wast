;; Test 5: Craft a scenario with a loop that demands an i64 result where an internal br instruction targets a block, unwinding the operand stack incorrectly and leaving an i32 value on the stack instead.

(assert_invalid
  (module
    (func $test
      (block (result i64)
        (loop (result i64) 
          (i32.const 42)
          (br 1)
        )
      )
    )
  )
  "type mismatch"
)