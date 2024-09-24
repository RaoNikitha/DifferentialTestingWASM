;; 8. Implement an `if` instruction with several `br` and `br_if` (branch) instructions within both `then` and `else` blocks. Differential behavior might emerge in how each implementation handles label-related stack manipulations.

(assert_invalid
  (module
    (func $test
      (block $outer
        (if (result i32)
          (i32.const 1)
          (then
            (i32.const 1)
            (br_if $outer)
            (i32.const 2)
          )
          (else
            (i32.const 3)
            (br $outer)
            (i32.const 4)
          )
        )
      )
    )
  )
  "type mismatch"
)