;; 5. **Test Complex Nesting with `IF`**: Use nested `if` structures with `br_if` instructions branching to `unreachable` within a `loop` included in the `if` block. This stresses correct operand handling and prevents the path from incorrectly reaching unreachable code.

(assert_invalid
  (module
    (func $complex-nesting-if (result i32)
      (block (result i32)
        (i32.const 1) (i32.const 1)
        (if (result i32)
          (then
            (loop (result i32)
              (if (result i32)
                (then (br_if 0 (unreachable)))
                (else (i32.const 1))
              )
            )
          )
          (else (i32.const 0))
        )
      )
    )
  )
  "unreachable code"
)