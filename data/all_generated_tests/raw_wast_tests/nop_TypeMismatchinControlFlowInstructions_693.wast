;; 4. **Nested Blocks with Nop**:    - Within a nested block, place a `nop` and then perform a stack operation that changes the expected type.    - Ensures the presence of `nop` in nested blocks does not lead to type inconsistencies.    - **Reasoning**: Checks `nop` impact in complex nested block typing.

(assert_invalid
  (module
    (func $nested-blocks-with-nop
      (block
        (block
          (nop)
          (i32.const 0)
          (br 0)
        )
        (f32.const 0.0)
      )
    )
  )
  "type mismatch"
)