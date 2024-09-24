;; 1. Create a WebAssembly module that contains a block with an expected result type of `i32`, but the `br` instruction targets a label with a different result type, such as `f32`. This test will check if the engine properly enforces the type constraints of the block.

(assert_invalid
  (module
    (func $type-mismatch-br
      (block (result i32)
        (block (f32.const 0.0) (br 0))
        (i32.const 42)
      )
    )
  )
  "type mismatch"
)