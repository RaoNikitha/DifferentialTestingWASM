;; 2. **Test Description**: Define a nested block where the inner block has a different stack result than the outer block but introduces an early branch (`br`) to an outer block. The test ensures that label indices and stack effects are correctly managed and restored upon branching.

(assert_invalid
  (module (func $nested-block-with-early-br (result i32)
    (block (result i32)
      (block (result f32) (br 1 (i64.const 1))) (i32.const 0)
    )
  ))
  "type mismatch"
)