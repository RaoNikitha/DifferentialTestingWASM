;; 6. Conduct a stress test with deeply nested function calls to the maximum allowed call depth. Check if the stack handles the depth correctly without exceeding limits and manage the return values appropriately.

(assert_invalid
  (module
    (func $recursive-depth (result i32) (call $recursive-depth))
    (func $start (result i32) (call $recursive-depth))
  )
  "maximum call depth exceeded"
)