;; 7. **Test Description 7**:    Construct a WASM module to export a function with a series of `block` and `loop`. Use a `br` instruction within nested blocks and external calls to verify the operand stack and control flow remain intact after returning to the calling module.

(assert_invalid
  (module
    (func $incorrect-br-target
      (block (result i32)
        (block (result i32)
          (block (result i32)
            (br 3) 
          )
        )
      )
    )
  )
  "unknown label"
)