;; 9. **Immediate `Unreachable` with Nested Ifs**:    Place an unreachable in an immediate nested second-level `if` to check layered flow control integrity.    ```    if (i32.const 1) if (i32.const 0) unreachable end i32.const 3 else i32.const 4 end    ```

(assert_invalid
  (module (func $nested-unreachable-within-if
    (if (i32.const 1) (then (if (i32.const 0) (then (unreachable)) (else) end) (i32.const 3)) (else (i32.const 4)) end)
  ))
  "unreachable executed"
)