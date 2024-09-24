;; Test 6: Arrange a sequence of `nop` instructions before a function call and immediately after the function call, with an `unreachable` within the called function. Verify that the `nop` instructions do not interfere with the execution flow leading to the `unreachable`.

(assert_invalid
  (module
    (func $test
      nop
      nop
      call $unreachable_func
      nop
      nop
    )
    (func $unreachable_func
      unreachable
    )
  )
  "unexpected trap"
)