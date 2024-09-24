;; 5. **Backward Branch in `loop` with Unreachable After `br`:**    - Develop a `loop` where a `br` instruction causes a backward jump and there’s an `unreachable` instruction right after the `br`.    - Ensures backward branching in loops avoids execution of subsequent unreachable instructions.

(assert_invalid
  (module (func $backward-branch-loop-unreachable
    (loop (br 0) (unreachable))
  ))
  "unreachable code after br"
)