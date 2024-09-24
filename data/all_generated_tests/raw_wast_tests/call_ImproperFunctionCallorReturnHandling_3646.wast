;; 5. **Test Description**: Attempt a call to a non-existent function index and ensure that an out-of-bounds error is triggered.

(assert_invalid
  (module
    (func $main (call 10))
  )
  "function index out-of-bounds"
)