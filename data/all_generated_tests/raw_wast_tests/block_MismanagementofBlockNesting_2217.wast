;; 8. **Deep Nesting with Interleaved Control Flow Constructs**:    Provide a deeply nested structure combining `block`, `loop`, and conditional branches like `if-else`, to test the robustness in managing complex, interleaved control flow constructs. This can expose issues with deep and complex block nesting.

(assert_invalid
  (module
    (func $deep-nesting-control (result i32)
      (block (result i32)
        (block (result i32)
          (loop (result i32)
            (block (if (i32.eqz (i32.const 0)) (then (br 2 (i32.const 42)) else (nop))))
            (br 1 (i32.const 10))
          )
          (i32.const 1)
        )
        (i32.const 2)
      )
    )
  )
  "block type mismatch"
)