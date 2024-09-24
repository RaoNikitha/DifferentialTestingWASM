;; 1. **Test Description:**    - Nested `block` with a `br` instruction targeting an out-of-bounds label. Validate whether the `unreachable` instruction is executed due to improper bounds checking on the label index.    - **Constraint: Label Definition**    - **Differential Behavior: The Wizard Engine is expected to catch the out-of-bounds access and terminate gracefully, whereas the WebAssembly implementation might reach the `unreachable` instruction.**

(assert_invalid
  (module
    (func $out-of-bounds-label
      (block
        (block (result i32)
          (br 2)
          (i32.const 0)
        )
      )
      (unreachable)
    )
  )
  "unknown label"
)