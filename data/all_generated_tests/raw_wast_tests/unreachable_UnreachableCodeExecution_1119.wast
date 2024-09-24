;; 10. Construct an example where a function includes multiple nested blocks, with the innermost block containing an `unreachable` instruction reached only under a specific nested condition, to check if the execution halts as expected in deeply nested contexts.

(assert_invalid
  (module (func $nested-blocks-unreachable
    (block
      (block
        (block
          (if (i32.const 0)
            (then
              (unreachable))
          )
        )
      )
    )
  ))
  "type mismatch"
)