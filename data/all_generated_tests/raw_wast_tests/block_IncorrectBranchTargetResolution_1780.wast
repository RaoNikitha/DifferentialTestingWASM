;; 1. **Cross-Nested Branch Targeting**: A block containing branches that target labels nested deep within multiple enclosing blocks. This tests if the `wizard_engine` resolves deep nested labels correctly within complexly nested blocks.

(assert_invalid
  (module (func $cross-nested-branch-targeting
    (block (result i32)
      (block (result i32)
        (block (result i32)
          (block (result i32)
            (br 3 (i32.const 42))
            (i32.const 1)
          )
          (br 2)
        )
      )
    )
  ))
  "type mismatch"
)