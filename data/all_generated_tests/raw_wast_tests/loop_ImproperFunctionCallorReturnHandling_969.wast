;; Design a loop performing nested function calls where one of the functions contains an `unreachable` instruction. The loop should handle this case based on a preceding conditional branch (`br_if`) that depends on an earlier function's returned value, testing error handling and control flow correctness.

(assert_invalid
  (module
    (func $nested (result i32)
      (i32.const 0)
      (br_if 0 (i32.eqz (call $inner)))
      (i32.const 1)
    )
    (func $inner (result i32)
      unreachable
      (i32.const 0)
    )
    (func
      (loop (result i32)
        (call $nested)
        (unreachable)
      )
    )
  )
  "unreachable instruction handling"
)