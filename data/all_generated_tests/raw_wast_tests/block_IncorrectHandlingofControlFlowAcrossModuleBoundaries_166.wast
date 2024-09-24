;; 7. Create a test where an exported function containing a `block` instruction calls back to the calling module with nested `block` and `br` instructions. Ensure correct unwinding of nested blocks across the boundary.

(assert_invalid
  (module
    (func $callee
      (block (result i32)
        (block (br 1 (i32.const 42)))
        (i32.const 0)
      )
    )
    (func (export "caller") (result i32)
      (call $callee)
    )
  )
  "type mismatch"
)