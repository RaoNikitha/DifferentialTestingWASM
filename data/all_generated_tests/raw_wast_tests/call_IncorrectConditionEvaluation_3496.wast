;; Test 5: Create a recursive function that calls itself conditionally using `br_if`. Verify if the recursion depth and the specific call stack sequence match across implementations, particularly when evaluating complex conditions.

(assert_invalid
  (module
    (func $recursive-call (param i32) 
      (local.get 0) 
      (i32.const 0) 
      (i32.ne) 
      (br_if 0 (call $recursive-call (local.get 0)))
    )
  )
  "type mismatch"
)