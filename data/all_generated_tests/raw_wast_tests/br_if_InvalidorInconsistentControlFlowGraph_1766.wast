;; 7. **Test Description**: Design a function with nested `block` and `loop` structures, employing `br_if` to conditionally break out from nested `loop` to an outer `block`. Check operand stack conforms to expected types.    - **Constraint Checked**: Operand type correctness in nested `loop` to `block` branches.    - **CFG Relation**: Ensures the CFG properly represents and handles control transfers within nested loops and blocks.

(assert_invalid
  (module
    (func $nested-loop-block
      (block $outer (result i32)
        (loop $inner
          (block $exit (result i32)
            (i32.const 0)
            (br_if $exit (i32.const 1))
          )
          (br $inner)
        )
      )
    )
  )
  "type mismatch"
)