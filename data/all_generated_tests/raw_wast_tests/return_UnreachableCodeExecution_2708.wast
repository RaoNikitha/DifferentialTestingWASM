;; Test 7: Create a function with a `return` in an `if-else` condition, followed by `unreachable`. Reason: Validates the execution path of `return` within conditional constructs.

(assert_invalid
  (module
    (func $return-in-if-else-followed-by-unreachable
      (if (i32.const 1)
        (then (return))
        (else (return))
      )
      unreachable
    )
  )
  "type mismatch"
)