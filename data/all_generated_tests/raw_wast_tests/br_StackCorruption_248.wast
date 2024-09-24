;; 9. **Test Description**: Develop a WebAssembly function with nested loops performing several stack manipulations and use `br` to jump across these loops. Test the integrity of the operand stack before and after branching in different implementations.

(assert_invalid
  (module
    (func $unexpected-stack-depth
      (block $outer (result i32)
        (loop $inner
          (i32.const 1)
          (loop $innermost
            (br $outer)
          )
        )
      )
    )
  )
  "type mismatch"
)