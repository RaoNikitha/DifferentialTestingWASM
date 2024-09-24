;; 9. **Test Mismatched Block Nesting with `br_if`**:    - Create mismatched nesting where a `br_if` within a block targets a sibling block incorrectly.    - This tests the conditional branching resolution across sibling block boundaries.    - Expected result: WebAssembly should error due to target mismatching, wizard_engine might resolve erroneously.

(assert_invalid
  (module
    (func $mismatched-block-nesting-br_if
      (result i32)
      (block (result i32)
        (block (result i32)
          (br_if 1 (i32.const 1))
          (i32.const 0)
        )
        (i32.const 2)
      )
    )
  )
  "type mismatch"
)