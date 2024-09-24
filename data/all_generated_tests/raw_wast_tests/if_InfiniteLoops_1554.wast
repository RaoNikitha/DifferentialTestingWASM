;; 5. Use an if condition evaluating a dynamic stack value (non-constant check), leading to an inner loop which improper implementations might not handle correctly, causing infinite execution:    ```    (local $condition i32)    (set_local $condition (i32.const 1))    (loop $outer      (if (get_local $condition)        (then (i32.store (i32.const 0) (i32.const 0)))        (else (br $outer))      )    )    ```    This challenges the handling of dynamic `if` conditions and checks if incorrect state management causes unending loops.

(assert_invalid
  (module
    (func $infinite-loop
      (local $condition i32)
      (set_local $condition (i32.const 1))
      (loop $outer
        (if (get_local $condition)
          (then (i32.store (i32.const 0) (i32.const 0)))
          (else (br $outer))
        )
      )
    )
  )
  "invalid block type"
)