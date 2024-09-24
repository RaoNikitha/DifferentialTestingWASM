;; Test 8: Create a WebAssembly function that includes multiple `br_if` branches conditioned to hit an `unreachable` instruction; ensure an early return prior to these branches secures against unseen `unreachable` mistakes.

(assert_invalid
  (module
    (func (param i32) (result i32)
      (select (local.get 0) (return) (i32.const 1))
      (unreachable)
    )
  )
  "type mismatch"
)