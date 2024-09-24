;; 2. Test Description: Create a WebAssembly function that starts with a `block` containing multiple pushes to the stack, followed by a `br` instruction to an outer block. Check that correct operands are popped and validate the stack integrity for both WebAssembly and `wizard_engine`.

(assert_invalid
  (module
    (func
      (block
        (i32.const 0)
        (i32.const 1)
        (i32.const 2)
        (block (br 1))
        (i32.add)
      )
      (drop)
    )
    (block
      (i32.const 3)
      (i32.const 4)
    )
  )
  "type mismatch"
)