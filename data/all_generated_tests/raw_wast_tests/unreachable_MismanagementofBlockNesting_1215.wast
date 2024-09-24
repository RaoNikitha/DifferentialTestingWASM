;; 6. Embed `unreachable` inside deeply nested `loop` and `if-else` structures that branch out conditionally via `br_table`, verifying that the control flow is only interrupted within the specific scopes and not other unrelated nested blocks.

(assert_invalid
  (module (func $type-nested-loop-unreachable (result i32)
    (block (result i32)
      (loop
        (block (br_table 0 1 (i32.const 1)) (i32.const 2))
        (if (i32.const 0)
          (then
            (block (loop (br_table 0 1 (i32.const 3)) (unreachable)))
            (i32.const 4)
          )
          (else
            (loop (unreachable))
            (i32.const 5)
          )
        )
      )
    )
  ))
  "type mismatch"
)