;; 6. **Test 6 - Nested Blocks with Invalid Label Reference**:    Design a program with nested `block` and `loop`, then perform a `br_if` using an invalid label index like `br_if 99`. The wizard_engine should detect the out-of-bounds label error, while WASM might generically fail.

(assert_invalid
  (module
    (func $nested-blocks-invalid-label
      (block
        (block
          (loop
            (br_if 99 (i32.const 1))
          )
        )
      )
    )
  )
  "unknown label"
)