;; 8. Use `try/catch` where the `try` block ends with `unreachable`, and observe if the `catch` maintains stack integrity, ensuring traps follow consistent type rules.

(assert_invalid
  (module (func $try-catch-unreachable (result i32)
    try (result i32) (unreachable) catch (i32.const 1) end
  ))
  "type mismatch"
)