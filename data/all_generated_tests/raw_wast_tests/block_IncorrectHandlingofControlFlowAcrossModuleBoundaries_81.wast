;; **Test 2:** Design a WASM module with an exported function containing nested `block` instructions. Import this function in another module and call it with a `call_indirect` instruction. This evaluates handling control flow, ensuring nested blocks maintain proper context when crossing module boundaries.

(assert_invalid
  (module
    (func $nested-blocks
      (block (result i32)
        (block (result i32)
          (i32.const 0)
          (br 1)
        )
        (i32.add)
      )
    )
    (func (export "call_nested_blocks") (call_indirect (type $nested-blocks)))
  )
  "type mismatch"
)