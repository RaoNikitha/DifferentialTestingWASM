;; 1. Test Description: Create a block with a `call` instruction to a function with a mismatched return type. Ensure the function returns an `i32` but the block is defined to return an `f32`. WebAssembly's `check_block` should catch the type mismatch, while `wizard_engine` might not handle the return type properly, causing an incorrect stack state.

(assert_invalid
  (module
    (type $t0 (func (result i32)))
    (func $f0 (type $t0)
      (i32.const 42)
    )
    (func (result f32)
      (block (result f32)
        (call $f0)
      )
    )
  )
  "type mismatch"
)