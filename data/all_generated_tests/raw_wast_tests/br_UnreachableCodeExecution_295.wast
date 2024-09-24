;; 6. **Cross-Block Operand Mismatch:**    Arrange a complex `block` scenario with differing operand types in nested contexts and use `br` instructions to branch across these blocks, inspecting for correctness in operand management and ensuring no `unreachable` instruction is executed due to type mismatches.

(assert_invalid
  (module
    (func $cross-block-operand-mismatch
      (block (result i32)
        (i32.const 42)
        (block (result i32)
          (f32.const 3.14)
          (br 1)
        )
        (i32.const 100)
      )
    )
  )
  "type mismatch"
)