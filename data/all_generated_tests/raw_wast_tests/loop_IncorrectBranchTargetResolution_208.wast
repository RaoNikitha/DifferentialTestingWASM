;; 9. **Loop with Branched Function Invocation**    - Test a loop where a `br` instruction leads to a function call and loops back after the function returns. This tests the scope and stack resolution handling across function boundaries within loops.

(assert_invalid
  (module
    (func $branched_function_loop (result i32)
      (local i32)
      (loop $myLoop (result i32)
        (local.set 0 (i32.const 1))
        (br $endLoop)
        (call 0) ;; invalid, unreachable code with no type context
        (local.get 0)
      )
      (local.get 0)
    )
  )
  "type mismatch"
)