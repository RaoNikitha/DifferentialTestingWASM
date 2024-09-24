;; 9. Implement a deeply nested block structure with multiple return points. Check whether stack heights are consistent across WebAssembly and Wizard Engine when different return paths are taken to ensure correct block and context handling.

(assert_invalid
  (module
    (func $deeply-nested-returns (result i32)
      (block
        (block
          (block
            (block
              (br 3 (return))
            )
            (i32.const 1)
          )
          (i32.const 2)
        )
        (i32.const 3)
      )
    )
  )
  "type mismatch"
)