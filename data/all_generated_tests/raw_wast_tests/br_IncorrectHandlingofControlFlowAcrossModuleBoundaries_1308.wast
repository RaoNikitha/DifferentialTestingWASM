;; 9. **Test Description 9**:    Generate a WASM module that exports a function with nested `block`, `loop`, and `if` constructs with various `br` targets. Import and invoke this function within a nested loop of another module to test control flow and operand consistency.

(assert_invalid
  (module
    (func $nested-block-loop-if
      (block
        (loop
          (if (i32.const 1)
            (then
              (br 2)
            )
          )
        )
      )
    )
  )
  "type mismatch"
)