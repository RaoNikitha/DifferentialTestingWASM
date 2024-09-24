;; 4. **Test Description**: Design a block with nested `block` and `loop` constructs, and place an incorrect `end` instruction to see if the implementation accurately catches the nesting error.    - **Constraint**: Validation of well-nested blocks and ensuring proper nesting closure with `end` instructions.    - **Nesting Mismanagement Check**: Checks if implementations correctly enforce block well-nesting requirements.

(assert_invalid
  (module
    (func
      (block
        (loop
          (end
        )
      )
    )
  )
  "unexpected end of section or function"
)