;; Test 2: Construct a nested function call scenario where an outer function calls an inner function with a deliberately invalid index. This aims to see if the CFG correctly handles nested calls and properly propagates errors from the inner to the outer function during an invalid function index lookup.

(assert_invalid
  (module
    (func $inner (call 999))
    (func $outer (call $inner))
  )
  "unknown function"
)