;; 5. **Test 5**: Test invokes a function returning `[i32, i32]` within a nested loop expecting `[i32]`. This checks if type checking within multiple nested control flow structures detects inconsistent type returns.

(assert_invalid
  (module
    (func $nested-loop-type-mismatch
      (loop
        (if (i32.const 1)
          (then
            (loop
              (call 0)
            )
          )
        )
      )
    )
    (func (result i32 i32)
      (i32.const 0)
      (i32.const 1)
    )
  )
  "type mismatch"
)