;; 7. **Test 7: Mixed Control Structures Resulting in Type Errors**    - Combine `block`, `loop`, and `if` where a `br` does not correctly match the composite result types expected by outer blocks.    - Validates mutual interplay and cumulative type checking across different control structures.    - Tests composite operand stack type consistency in complex control flow layouts.

(assert_invalid
  (module 
    (func $mixed-control-structures-type-error
      (block (result i32)
        (loop (result i32)
          (if (i32.eqz (i32.const 0))
            (then
              (block (br 2 (i32.const 1)))
            )
          )
        )
        (i32.const 2)
      )
    )
  )
  "type mismatch"
)