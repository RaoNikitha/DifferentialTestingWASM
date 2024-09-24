;; 3. **Deeply Nested Function Calls within Blocks**:    - Create a structure with deeply nested blocks that have function calls at various depths. Check if the return from called functions leads to the correct block.    - Evaluate if altering block depths significantly affects function returns due to index mismanagement.

(assert_invalid
  (module
    (func $nested-blocks
      (block
        (block
          (block
            (block
              (block
                (call $nested-function (i32.const 0))
              )
            )
          )
        )
      )
    )
    (func $nested-function (param i32))
  )
  "type mismatch"
)