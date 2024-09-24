;; 9. **Test 9**: Validate the behavior of `nop` instructions within a switched context function being called multiple times. Place an `unreachable` instruction in the end after multiple calls to ensure proper stack unwinding and no premature termination.

(assert_invalid
  (module
    (func $check (nop) (nop) (nop) (nop) (nop))
    (func $main (result i32)
      call $check
      call $check
      call $check
      unreachable))
  "unexpected return type"
)