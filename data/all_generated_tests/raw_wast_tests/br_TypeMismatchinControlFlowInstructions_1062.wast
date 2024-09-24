;; 3. **Test for Type Mismatch with Nested Blocks and Branches:**    Nest two blocks where the inner block expects an `f32` result. Insert a `br` instruction in the inner block pointing to the outer block, with an `i32` value on the stack to expose any type mismatch handling errors.

(assert_invalid
  (module
    (func $nested-type-mismatch
      (block
        (block (result f32)
          (i32.const 0)
          (br 1)
        )
      )
    )
  )
  "type mismatch"
)