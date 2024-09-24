;; 9. **Test br_if to Multiple Forward and Backward Jumps in Nested Blocks**:     Write a scenario with multiple forward jumps (`blocks`) and backward jumps (`loops`) controlled by `br_if`. The test will ensure proper differentiation of block (`forward`) and loop (`backward`) branches and correct stack management.

(assert_invalid
  (module
    (func $nested-br_if
      (block $outer (result i32)
        (block $inner (result i32)
          (loop $loop
            (block
              (br_if 2 (i32.const 1)) ; Forward jump to $outer
              (br_if 1 (i32.const 0)) ; Forward jump to $inner but with false condition
            )
            (br_if 0 (i32.const 1))   ; Backward jump to $loop
          )
        )
      )
      (i32.const 1)
    )
  )
  "type mismatch"
)