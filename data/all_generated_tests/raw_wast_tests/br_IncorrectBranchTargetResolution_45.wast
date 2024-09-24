;; 6. Create a scenario where `br` targets an undefined label within a `block` and a `loop` to test if the implementation handles label lookups correctly, ensuring appropriate error handling for **invalid label definitions**.

(assert_invalid
  (module
    (func
      (block (br 1))
    )
  )
  "undefined label"
)