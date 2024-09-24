;; Test 9: Construct a function where a valid function index becomes invalid due to changes in the program state in different execution paths. This evaluates if the CFG correctly adjusts to state-dependent scenarios and applies suitable error handling consistently across different paths.

(assert_invalid
  (module
    (func $state-dependent (param i32)
      (if (i32.eq (local.get 0) (i32.const 1))
        (then (call 1))
        (else (call 0))
      )
    )
    (func)
    (func)
  )
  "type mismatch"
)