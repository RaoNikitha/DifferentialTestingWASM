;; 10. **Test 10**: Test a function with unreachable code following a `return` statement. Place non-trivial statements after the `return` and verify whether any engines incorrectly executes or analyze this "dead" code, exposing CFG handling flaws.

(assert_invalid
  (module
    (func $unreachable-following-return (result i32)
      (return (i32.const 42))
      (drop (i32.const 100))
    )
  )
  "unreachable code after return"
)