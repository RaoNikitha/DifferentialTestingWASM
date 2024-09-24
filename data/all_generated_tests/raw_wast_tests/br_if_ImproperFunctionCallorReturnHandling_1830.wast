;; - A function containing a nested `block` structure with a `br_if` instruction that conditionally breaks to the outer block based on a comparison result, immediately followed by a function return. This tests whether improper stack unwinding or incorrect referencing of the block label affects the function's return behavior.

(assert_invalid
  (module
    (func $nested-block-br_if
      (block
        (block
          (i32.const 0)
          (i32.eqz)
          (br_if 1)
        )
        (return)
      )
    )
  )
  "type mismatch"
)