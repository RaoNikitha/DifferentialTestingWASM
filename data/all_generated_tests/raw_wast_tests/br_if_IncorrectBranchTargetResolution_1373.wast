;; 4. **Test Description 4: Improper Outer Block Jump**    - Implement multiple `block` and `loop` constructs. Place a `br_if` to index `3` to test if it jumps to a correct outermost enclosing block.

(assert_invalid
  (module
    (func $nested-br_if
      (block
        (loop
          (block
            (br_if 3 (i32.const 1))
          )
        )
      )
    )
  )
  "type mismatch"
)