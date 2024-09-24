;; 9. Introduce `unreachable` within a try-catch block to determine how each environment handles an immediate trap occurring within error handling scopes. Confirm if error handling mechanisms consistently manage unreachable traps.

(assert_invalid
  (module (func $type-unreachable-in-try-catch
    (try (result i32)
      (do (unreachable))
      (catch_all (i32.const 1))
    )
  ))
  "type mismatch"
)