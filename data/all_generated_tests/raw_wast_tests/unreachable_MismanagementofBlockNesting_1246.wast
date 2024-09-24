;; 7. Execute `unreachable` within a conditional inside a nested loop and test with a `br_if` at different nesting depths. Ensures the implementation correctly handles exit paths from deeply nested structures post-trap.

(assert_invalid
  (module (func $nested-loop-br_if-trap
    (block
      (loop
        (block
          (if (i32.const 1)
            (then (unreachable))
          )
          (br_if 1 (i32.const 0))
        )
      )
    )
  ))
  "type mismatch"
)