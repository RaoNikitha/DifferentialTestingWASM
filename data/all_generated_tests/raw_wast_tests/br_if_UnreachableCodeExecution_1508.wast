;; - **Test 9**: Implement a control flow where a `br_if` conditionally jumps into a `loop`, with `unreachable` instructions placed immediately before and after the jump targets. This helps identify issues with backward jumps and stack states leading to unexpected terminations.

(assert_invalid
  (module
    (func $test-9 (result i32)
      (block (result i32)
        (loop (result i32)
          (br_if 0 (i32.const 1))
          unreachable
        )
        unreachable
        (i32.const 0)
      )
    )
  )
  "type mismatch"
)