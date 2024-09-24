;; 10. **`nop` in Complex Nested Levels and Memory Ops**:    Implement deeply nested blocks containing different memory operations (`load`, `store`) and add `nop` instructions alongside. This examines if memory operations within nested levels remain unaffected by `nop` while maintaining control depth.

(assert_invalid
  (module
    (func $nested-memory
      (block
        (block
          (block
            (block
              (i32.load (i32.const 0))
              (nop)
              (i32.store (i32.const 0) (nop))
            )
          )
        )
      )
    )
  )
  "type mismatch"
)