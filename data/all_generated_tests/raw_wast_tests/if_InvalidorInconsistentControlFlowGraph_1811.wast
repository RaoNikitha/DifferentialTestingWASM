;; 2. Develop a nested `if` within another `if` where the inner `if` has an incorrect block type, causing invalid stack handling. Verify if both implementations handle this CFG inconsistency similarly.

(assert_invalid
  (module
    (func
      (if (result i32)
        (i32.const 1)
        (then
          (if (result i32 i32)
            (i32.const 1)
            (then (i32.const 2) (i32.const 3))
            (else (i32.const 4))
          )
        )
        (else (i32.const 5))
      )
    )
  )
  "type mismatch"
)