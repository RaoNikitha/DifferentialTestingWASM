;; 5. **Mismanaged Block Type with Nested Loops**:    Create nested loops with differing block types and perform condition checking and branching back to the outer loop.    This ensures block type handling is valid and consistent within nested structures.

(assert_invalid
  (module (func $nested-loop-mismatch
    (loop (result i32)
      (br_if 0 (i32.const 1))
      (loop (result f32)
        (br_if 1 (i32.const 0))
      end)
    end)
  ))
  "type mismatch"
)