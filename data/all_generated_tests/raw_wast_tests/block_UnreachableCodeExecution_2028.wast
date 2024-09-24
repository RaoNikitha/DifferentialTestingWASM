;; 9. **Test Description**:    Formulate a block containing an instruction sequence that should normally complete, but with a `br` statement making it reach an `unreachable`. This test checks management of unintended control flow jumping directly into an invalid code path.

(assert_invalid
  (module (func $block-unreachable-with-br (result i32)
    (block (result i32)
      (br 0)
      (unreachable)
    )
  ))
  "type mismatch"
)