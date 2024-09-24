;; Test 8: Include `nop` instructions in a sequence mixed with various arithmetic operations ending in an `unreachable`. Check that the sequence properly processes operations and reaches the `unreachable` correctly.

(assert_invalid
  (module
    (func $test-8
      (i32.const 42)
      (nop)
      (i32.const 13)
      (nop)
      (i32.add)
      (nop)
      (unreachable)
    )
  )
  "unreachable instruction reached"
)