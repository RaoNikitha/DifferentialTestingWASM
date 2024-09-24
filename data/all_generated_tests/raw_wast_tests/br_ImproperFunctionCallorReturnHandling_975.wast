;; 6. **Indirect Function Call within Deeply Nested Loop:**    - Inside a deeply nested `loop`, use `call_indirect` to call a function that contains another `loop` and a `br` back to the outer loop level. Validate that returning from the function and the branch are managed correctly, maintaining proper control flow hierarchy.

(assert_invalid
  (module
    (type $t (func))
    (table 1 funcref)
    (func $nested_loop
      (loop $outer
        (loop $inner
          (call_indirect (type $t) (i32.const 0))
          (br $outer)
        )
      )
    )
    (func (type $t)
      (loop $inner
        (br $inner)
      )
    )
  )
  "type mismatch"
)