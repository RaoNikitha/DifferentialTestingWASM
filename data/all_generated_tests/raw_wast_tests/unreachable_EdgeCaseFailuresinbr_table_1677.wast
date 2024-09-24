;; 8. **Test 8:** Devise a `br_table` with indirect calls, where `unreachable` is present before indirect calls to target functions. Confirm the engine traps immediately on `unreachable` rather than proceeding to calls.

(assert_invalid
  (module
    (func $test (param i32) (result i32)
      (block $outer
        (block $inner
          (br_table $inner $outer (local.get 0))
          (unreachable)
        )
      )
      (i32.const 0)
    )
  )
  "unreachable instruction trapped"
)