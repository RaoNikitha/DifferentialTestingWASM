;; 1. **Test Description**: A `block` with nested sub-blocks, and a `br` instruction targeting an outer block label.    **Reasoning**: This tests the correct label shifting and resolution within a deeply nested block structure.

(assert_invalid
 (module (func $nested-block (result i32)
   (block (result i32)
     (block
       (br 1)
     )
     (i32.const 0)
   )
 ))
 "type mismatch"
)