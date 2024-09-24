;; Test 6: Build a test where a conditional `br_if` is placed inside a function that is called by another function. Ensure that the stack state is maintained correctly across both function calls and returns.

(assert_invalid
  (module
    (func $inner (block (result i32) (i32.const 1) (br_if 0 (i32.const 1))))
    (func $outer (call $inner) (i32.const 1) (drop))
    (start $outer)
  )
  "type mismatch"
)