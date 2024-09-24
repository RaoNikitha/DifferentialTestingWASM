;; Construct a test with multiple nested `block` structures. Insert a `br` instruction that targets a label defined in a non-well-nested manner, causing the flow to reach an `unreachable` instruction if control flow is improperly handled.

(assert_invalid
  (module
    (func $nested-br-test
      (block $outer
        (block $inner
          (br 1)
          unreachable
        )
      )
    )
  )
  "unknown label"
)