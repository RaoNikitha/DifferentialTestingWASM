;; Test 1: Create a function that calls another function with an invalid index; observe if a specific error message is generated for the unknown function index. Validate if the same error handling is in place across both implementations.

(assert_invalid
  (module
    (func $invalid-func-index (call 999))
  )
  "unknown function"
)