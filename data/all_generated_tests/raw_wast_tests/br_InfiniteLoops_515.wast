;; 6. **Test Description:**    A `block` nesting a loop where the loop contains a `br_if` instruction intended to conditionally exit the `block`. Test if the condition and branch target are handled properly, otherwise causing the loop not to exit.

(assert_invalid
  (module
    (func $conditional-loop-exit
      (block $outer
        (loop $inner
          (br_if $outer (i32.const 1))
        )
      )
      (i32.const 0) (drop)
    )
  )
  "type mismatch"
)