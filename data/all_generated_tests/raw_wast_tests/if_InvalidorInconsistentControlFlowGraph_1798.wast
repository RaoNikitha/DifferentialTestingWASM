;; 9. Construct a sequence where an `if` block’s `then` portion introduces a new label but bypassed through the `else` leading to non-compliance with function type’s output specification, causing CFG errors.

(assert_invalid
  (module
    (func
      (if (result i32)
        (i32.const 1)
        (then (br 0) (i32.const 0))
        (else (i32.const 2))
      )
      (drop)
    )
  )
  "type mismatch"
)