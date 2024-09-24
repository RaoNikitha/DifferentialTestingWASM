;; Create a test with nested loops, each containing function calls and branches to validate if context extensions and stack management within nested environments can handle multiple function calls and returns correctly.

(assert_invalid
  (module
    (func $nested-loops-with-func-calls
      (loop
        (call $dummy)
        (loop
          (call $dummy)
          (br 1)
        )
        (br 0)
      )
    )
    (func $dummy)
  )
  "type mismatch"
)