;; A `try-catch` block wherein the `catch` block returns a value of a different type than the `try` block, to observe how both engines manage operand stack unwinding during exception handling.

(assert_invalid
  (module
    (func $type-mismatch-in-try-catch (result i32)
      (try (result i32)
        (do 
          (i32.const 42)
          (return)
        )
        (catch 
          (f32.const 0.0)
          (return)
        )
      )
    )
  )
  "type mismatch"
)