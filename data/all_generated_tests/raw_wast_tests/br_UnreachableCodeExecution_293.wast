;; 4. **Invalid Outward Branch:**    Design a test where `br` erroneously targets a non-existent label index in a nested block scenario. Check if the test catches the invalid branch and triggers an `unreachable` instruction due to incorrect label lookup and handling.

(assert_invalid
  (module
    (func
      (block (result i32)
        (block
          (br 2)
        )
        (i32.const 0)
      )
    )
  )
  "unknown label"
)