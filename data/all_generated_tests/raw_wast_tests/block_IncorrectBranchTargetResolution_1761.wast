;; 2. A test with nested blocks where an inner block contains a `br` instruction targeting a label index of 1, verifying if the control flow correctly branches to the enclosing block's end. This ensures proper label indexing and resolution.

(assert_invalid
  (module (func $nested-blocks-br-incorrect-label (result i32)
    (block (result i32)
      (block (result i32)
        (br 1 (i32.const 42)) ; This should target the outer block, testing out incorrect label indexing
      )
      (i32.const 0) ; Dummy instruction to pop the stack
    )
  ))
  "type mismatch"
)