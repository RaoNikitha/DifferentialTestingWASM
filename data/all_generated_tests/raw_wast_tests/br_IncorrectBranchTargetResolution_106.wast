;; 7. **Test Label Offsetting in Complex Structures:**    - Include multiple `if`, `block`, and `loop` instructions at various nesting levels. Use `br` to target specific blocks. Checks correct offsetting and resolution amidst complex nesting.

(assert_invalid
  (module
    (func (result i32)
      (block
        (loop
          (block
            (if
              (br 2)
            )
          )
        )
      )
    )
  )
  "type mismatch"
)