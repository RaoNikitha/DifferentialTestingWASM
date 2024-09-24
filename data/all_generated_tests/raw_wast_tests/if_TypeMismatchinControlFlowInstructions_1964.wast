;; 5. Formulate a test involving an `if` block with a `blocktype` of `[] -> []`, but both branches use `i32` stack manipulations. This verifies if type consistency is maintained when the branches use non-matching operations.

(assert_invalid
  (module
    (func $incorrect_blocktype
      (i32.const 0)
      (if (result) (then (i32.const 42)) (else (drop)))
    )
  )
  "type mismatch"
)