;; 8. A test containing an `if` instruction with nested `else` block having a sequence of `br` instructions to outer loops, ensuring correct label management and exit paths are maintained to avoid inadvertently creating infinite loops.

(assert_invalid
  (module
    (func $test
      (block $outer
        (loop $inner
          (i32.const 0)
          (if (result i32)
            (i32.const 1)
            (then
              (br 1)  ;; Breaks to $outer block
            )
            (else
              (br 2)  ;; Invalid: tries to break two levels, but only one loop and one block exist
            )
          )
        )
      )
    )
  )
  "invalid label index"
)