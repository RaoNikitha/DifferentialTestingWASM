;; 8. Initiate a test with `nop` followed by a `br_if` within a block, verifying that the condition maintains control flow integrity across implementations, noting differences in wizard_engine's branch behavior.

(assert_invalid
  (module
    (func
      (block
        (nop)
        (br_if 0 (i32.const 0))
      )
    )
  )
  "type mismatch"
)