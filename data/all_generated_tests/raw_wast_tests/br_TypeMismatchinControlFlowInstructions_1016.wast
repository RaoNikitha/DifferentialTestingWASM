;; Test 7: Develop an if structure that expects an f32 result but includes a br instruction that transfers control unexpectedly to a block configured to produce an i32 result, testing operand type consistency.

(assert_invalid
  (module
    (func $test-f32-i32-mismatch
      (block (result i32)
        (if (result f32)
          (then (br 0 (i32.const 42)))
        )
      )
    )
  )
  "type mismatch"
)