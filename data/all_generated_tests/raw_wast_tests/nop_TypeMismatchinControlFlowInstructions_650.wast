;; 1. Create a function that uses a `block` instruction containing a `nop` followed by an integer `i32.const` and `i32.add`, then return from the block. The differential test checks if the type validation of `block` within the different implementations correctly supports the `nop` in between the operations.

(assert_invalid
  (module
    (func (result i32)
      (block (result i32)
        nop
        i32.const 1
        i32.const 2
        i32.add
      )
    )
  )
  "type mismatch"
)