;; 4. **Test 4**: Design a function with nested `if-else` branches, each branch containing a `call` instruction referring to distinct function types. Evaluate if each branch correctly aligns with expected stack operations post-function call.

(assert_invalid
  (module
    (func $nested-branches
      (if (i32.const 1)
        (then (call 1 (i32.const 10)))
        (else (call 2 (i64.const 20)))
      )
    )
    (func $func1 (param i32) (result i32) (i32.const 0))
    (func $func2 (param i64) (result i32) (i32.const 0))
  )
  "type mismatch"
)