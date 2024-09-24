;; Test 4: Call a sequence of nested functions where one function returns a special value that accidentally triggers an 'unreachable' instruction in the calling function.

(assert_invalid
  (module
    (func $nested-calls
      (call $func-a (i32.const 0))
    )
    (func $func-a (param i32)
      (call $func-b (local.get 0))
    )
    (func $func-b (param i32) (result i32)
      (if (i32.eq (local.get 0) (i32.const 0))
        (then (unreachable))
        (else (local.get 0))
      )
    )
  )
  "unreachable executed"
)