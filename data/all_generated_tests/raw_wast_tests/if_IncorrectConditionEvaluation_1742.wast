;; 3. Create a nested `if` structure with alternating true and false conditions, ensuring the `br_if` statement branches correctly based on its condition. This test examines handling of multiple nested conditions with interleaved branch evaluations.

(assert_invalid
  (module
    (func $nested-if-branch
      (if (result i32)
        (i32.const 1)
        (then
          (if (result i32)
            (i32.const 0)
            (then
              (br_if 0 (i32.const 0))
              (i32.const 1)
            )
            (else
              (br_if 0 (i32.const 0))
            )
          )
          (i32.const 1)
        )
        (else
          (i32.const 0)
        )
      )
    )
  )
  "type mismatch"
)