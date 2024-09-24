;; 8. Create a function with multiple `return` paths having different operand effects. Test if the function's correct return type is consistently applied to both WebAssembly and Wizard Engine without mismatches in expected values.

(assert_invalid
  (module
    (func $multi-return-paths (result i32)
      (block
        (i32.const 42)
        (return)
        (i32.const 0)
      )
      (i32.load (return (i32.const 100)))
      (return)
    )
  )
  "type mismatch"
)