;; Test 6: Construct a block expecting an f64 result and utilize a br instruction that misdirects to a loop intended to handle i32 results, leading to a runtime type mismatch.

(assert_invalid
  (module
    (func $type-mismatch-block-loop
      (block (result f64)
        (loop
          (br 1 (i32.const 42))
        )
      )
    )
  )
  "type mismatch"
)