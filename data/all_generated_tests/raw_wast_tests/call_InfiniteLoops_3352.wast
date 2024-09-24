;; 1. Create a function that recursively calls itself without a base case, ensuring the function index is valid. The differential behavior will occur if the WebAssembly implementation correctly detects the infinite recursion and handles the error, while the `wizard_engine` may not detect it and result in an infinite loop.

(assert_invalid
  (module
    (func $infinite_recursion (loop (call $infinite_recursion)))
  )
  "unreachable"
)