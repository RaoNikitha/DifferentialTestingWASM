;; 1. **Test Call to Invalid Function Index**:    Verify behavior when calling a function with an index that is out of the bounds of the function table. This tests the function index constraint and checks if the implementation correctly traps or continues to an `unreachable` instruction due to invalid index handling.

(assert_invalid
  (module
    (func $invalid-call (call 9999 (i32.const 42)))
  )
  "unknown function"
)