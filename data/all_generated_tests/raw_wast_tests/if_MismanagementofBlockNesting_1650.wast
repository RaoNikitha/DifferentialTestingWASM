;; 1. Create a WebAssembly module with deeply nested `if` blocks inside loops, then use a `br` instruction to break out of multiple nested levels. This tests whether the implementation correctly resets and manages the depth of the nested blocks, ensuring the break targets the correct block.

(assert_invalid
  (module
    (func $deeply_nested_if_blocks
      (block $outer
        (i32.const 1)
        (if (result i32)
          (loop $inner
            (block $nested
              (if (result i32)
                (i32.const 1)
                (then
                  (br $outer) ;; Break to the outer block
                )
              )
            )
          )
        )
      )
    )
  )
  "invalid break level"
)