;; 8. **Test Description**:     Develop a complex function that handles multiple levels of `try` and `catch` blocks, with each block containing `nop` instructions. Inspect if the exception handling and stack state are preserved.    **Constraint**: `nop` must not alter exception handling and stack unwinding.    **Reasoning**: Ensures reliable stack behavior and exception handling without stack corruption by `nop`.

(assert_invalid
  (module
    (func $complex_try_catch
      (try
        (do (nop))
        (catch_all (nop))
        (catch $e1 (nop))
        (catch $e2 (nop)))
    )
  )
  "traps or validation errors"
)