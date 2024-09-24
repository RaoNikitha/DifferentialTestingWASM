;; Test 10: Setup a nested structure of blocks where the innermost block assumes an f64 result. Use a br instruction targeting an outer block configured for an i64 result, testing correct type handling and stack management.

(assert_invalid
  (module
    (func $test
      (block (result i64)
        (block (result f64)
          (br 1 (i64.const 42))
        )
      )
    )
  )
  "type mismatch"
)