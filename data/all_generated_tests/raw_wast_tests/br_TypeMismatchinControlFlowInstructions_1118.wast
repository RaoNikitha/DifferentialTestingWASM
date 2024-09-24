;; 9. **Test Description:**    - Implement an `if` block where the true branch works with `i64`, and the false branch with `f64`.    - Use a final `br` instruction improperly bridging the types (`i64` after an `f64` branch or vice-versa).    - The differential behavior tests if control flow properly differentiates between branch exits by type.

(assert_invalid
  (module
    (func $type-mismatch-in-if
      (block
        (i32.const 1)
        (if
          (then (i64.const 42) (br 0))
          (else (f64.const 42.0) (br 0))
        )
      )
    )
  )
  "type mismatch"
)