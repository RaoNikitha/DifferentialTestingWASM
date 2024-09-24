;; 1. **Test Description**: Create a set of nested blocks where a `br` instruction attempts to jump to the immediate outer block while validating if the correct label index is targeted. This tests whether label indices are correctly managed within nested contexts.

(assert_invalid
  (module (func $type-nested-block-br (result i32)
    (block (result i32)
      (block
        (br 1 (i32.const 10))
      )
    )
  ))
  "type mismatch"
)