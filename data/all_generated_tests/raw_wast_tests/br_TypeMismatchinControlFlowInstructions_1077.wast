;; 8. Implement an `if` instruction in a block where the `true` branch exits with a float and the `false` branch exits using `br` without providing any stack value. This test checks if the implementation correctly detects type mismatches in conditional branches.

(assert_invalid
  (module
    (func $mismatched-if-branch
      (block
        (if (result f32)
          (then (f32.const 0.0))
          (else (br 0))
        )
        (drop)
      )
    )
  )
  "type mismatch"
)