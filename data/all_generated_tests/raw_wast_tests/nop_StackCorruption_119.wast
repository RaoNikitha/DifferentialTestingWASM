;; 10. Utilize `nop` in conjunction with `try` and `catch` sequences to deal with exception handling, verifying that `nop` does not lead to any unexpected stack state changes or corruption across the try-catch control flow transitions.

(assert_invalid
  (module
    (func (try (result i32)
      (do (nop) (i32.const 1))
      (catch (nop) (i32.const 2))
    ))
  )
  "type mismatch"
)