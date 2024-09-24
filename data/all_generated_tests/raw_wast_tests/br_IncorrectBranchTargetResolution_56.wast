;; 7. **Test Description: Jump Over Multiple Instructions**    - Set up a sequence of instructions interleaved with `block` and `loop`, and add a `br` instruction jumping over multiple instructions.

(assert_invalid
  (module
    (func
      (block
        (i32.const 0)
        (i32.const 1)
        (loop
          (i32.const 2)
          (br 1)
          (i32.const 3)
        )
        (i32.const 4)
      )
    )
  )
  "type mismatch"
)