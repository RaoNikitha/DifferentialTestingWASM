;; 5. **Complex Nesting with Mixed Control Instructions**: Construct a sequence with nested `block`, `loop`, and `if` structures, each containing `nop`. Include `br` and `br_if` to test if `nop` is managed correctly within intricate control flow scenarios.

(assert_invalid
  (module
    (func $complex
      (block
        (loop
          (nop)
          (if (i32.const 1)
            (block (br 1))
            (block (nop) (br_if 0 (nop)))
          )
        )
      )
    )
  )
  "type mismatch"
)