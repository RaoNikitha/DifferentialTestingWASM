;; 2. Implement nested `block` instructions with an inner block containing a `br` instruction targeting an outer block. Check if the stack unwinds correctly during the branch and verifies proper nesting handling.

(assert_invalid
  (module (func $nested-block-br (result i32)
    (block (result i32)
      (block (result i32)
        (br 1 (i32.const 0))
      )
      (i32.const 1)
    )
  ))
  "type mismatch"
)