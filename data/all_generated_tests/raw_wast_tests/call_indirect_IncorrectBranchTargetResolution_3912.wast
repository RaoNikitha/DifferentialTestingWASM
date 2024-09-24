;; ```text 1. Define a WebAssembly module with multiple nested blocks and calls to `call_indirect`, ensuring that one path has an indirect call leading to a `br` instruction that targets an incorrect block index due to a function signature mismatch.

(assert_invalid
  (module
    (type (func (param i32) (result i32)))
    (type (func (result i32)))
    (table 1 funcref)
    (elem (i32.const 0) $f1)
    (func $f1 (param i32) (result i32) (local.get 0))
    (func (result i32)
      (block (result i32)
        (block (result i32)
          (i32.const 0)
          (call_indirect (type 0) (i32.const 0))
          (br 1)
        )
        (i32.const 42)
      )
    )
  )
  "type mismatch"
)