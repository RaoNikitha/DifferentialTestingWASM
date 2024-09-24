;; 6. **Test Description:**    Use a `br` with multiple nested `block` and `loop` structures, each manipulating the operand stack.    **Constraint Checked:** Proper maintenance of stack height through multiple levels of control flow.    **Relation to Stack Corruption:** Loss of track of operand levels could result in stack corruption.

(assert_invalid
  (module
    (func $nested-structure-with-br
      (block (result i32)
        (loop (result i32)
          (block (result i32)
            (br 2 (i32.const 42))
            (br 1 (i32.const 99))
            (i32.const 0)
          )
          (i32.const 0)
        )
      )
      (i32.eqz) (drop)
    )
  )
  "type mismatch"
)