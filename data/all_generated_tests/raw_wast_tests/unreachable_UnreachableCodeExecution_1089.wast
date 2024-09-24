;; 10. **Test exception handling leading to `unreachable`:**    - Catch and rethrow sequences where an unreachable executes if exceptions don't match the expected pattern.    - **Constraint:** Checks correct implementation of exception handling pathways.    - **Related to**: Evaluates erroneous exception control flow leading to unintentional traps.

(assert_invalid
  (module
    (func (try (do
                 (try (do (unreachable)
                          (throw 0))
                      (catch_all))
                 (throw 0))
              (catch_all))
         (unreachable))
  )
  "type mismatch"
)