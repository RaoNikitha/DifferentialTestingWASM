;; 5. **Test 5: Function Call with `unreachable` Early Return**    - Tests a function call where `unreachable` is used right after the function's initial operations.    - Checks if return values/arguments of the function are properly handled when interrupted by `unreachable`.    - Ensures function's stack frames are correctly dismantled without corruption.

(assert_invalid
  (module
    (func $test_func
      (local i32)
      ;; Initial operations
      (i32.const 10)
      (set_local 0)
      ;; `unreachable` instruction causing early trap
      (unreachable)
      ;; Additional operations after unreachable
      (i32.const 20)
      (return)
    )
  )
  "unreachable executed"
)