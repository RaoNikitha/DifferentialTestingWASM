;; Test 7: Implement a loop containing nested function calls, where each function call manipulates the stack and returns values. Ensure that the stack operations from the called functions do not disrupt the loop's control flow, thereby preventing infinite loops.

(assert_invalid
  (module
    (func $inner (result i32)
      local.get 0
      i32.const 1
      i32.add
    )
    (func $outer (result i32)
      i32.const 10
      loop (result i32)
        call $inner
        local.tee 0
        br_if 1
      end
    )
  )
  "type mismatch"
)