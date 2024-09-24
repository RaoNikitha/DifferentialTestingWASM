;; Insert `nop` between instructions inside a `try-catch` block that alters stack types, resulting in the types exiting the `try` block not matching expected catch block types. Observe if the wizard_engine validation misses this.

(assert_invalid
  (module
    (func $type-mismatch-in-try-catch
      (try (result i32)
        (do
          (i32.const 1)
          (nop)
          (throw 0))
        (catch 0
          (i64.const 1)
          (end))))
  "type mismatch")