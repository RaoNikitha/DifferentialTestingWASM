;; 4. **Test Scenario**: Create a try-catch block where `return` is used in the try section and an unreachable instruction is present in the catch section.    **Constraint**: Ensures `return` exits try block correctly without invoking catch.    **Unreachable Code**: Test if catch block with unreachable gets erroneously triggered.

(assert_invalid
  (module
    (func $try_return (result i32)
      (try (result i32)
        (do (return (i32.const 42)))
        (catch (unreachable))
      )
    )
  )
  "type mismatch"
)