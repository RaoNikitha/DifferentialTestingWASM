;; 7. Design a bad `select` instruction where one of the selectable values leads to an `unreachable` instruction. The test ensures that choosing this path correctly results in a trap in both engines.

(assert_invalid
  (module (func $bad-select-unreachable
    (select (unreachable) (i32.const 1) (i32.const 0))
  ))
  "type mismatch"
)