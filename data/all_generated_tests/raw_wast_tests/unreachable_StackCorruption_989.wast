;; 10. Develop a test where the `unreachable` instruction is part of an exception handling mechanism (try-catch). Check that upon reaching `unreachable`, an exception is thrown, and stack operations within the catch block do not affect the original control flow.

(assert_invalid
  (module
    (func (try (do (unreachable)) (catch (nop) (drop (i32.const 1)))))
  )
  "type mismatch"
)