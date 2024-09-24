;; Test 2: Define a function that attempts to return a value from an intermediate block which is nested within another block that ends with an `unreachable` instruction. Verify correct return flow that avoids hitting the `unreachable` code.

(assert_invalid
  (module
    (func $nested-block-return (result i32)
      (block
        (block (br 0 (return (i32.const 42))))
        unreachable
      )
    )
  )
  "type mismatch"
)