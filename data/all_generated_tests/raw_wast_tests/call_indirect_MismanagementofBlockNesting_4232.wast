;; 1. **Test 1**: Execute `call_indirect` inside a nested block:    - Create a Wasm module with a nested block structure containing a `call_indirect` instruction.    - Ensure the function type is defined multiple levels deep.    - Check if the `call_indirect` correctly respects block nesting and returns without trapping.

(assert_invalid
  (module
    (type (func (param i32) (result i32)))
    (table 1 funcref)
    (elem (i32.const 0) $func0)
    (func $func0 (type 0) (param i32) (result i32) (i32.add (local.get 0) (i32.const 1)))
    (func (result i32)
      (block (result i32)
        (block (result i32)
          (call_indirect (type 0) (i32.const 0) (i32.const 42))
        )
      )
    )
  )
  "table index out of bounds"
)