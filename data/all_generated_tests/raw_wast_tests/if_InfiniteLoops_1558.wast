;; 9. Formulate a test with an outer `if` that conditionally runs an inner loop depending on blocktype results. Errors in block typing might loop infinitely instead of breaking:    ```    (if (result i32) (i32.const 1)      (then         (loop $inner          (br $inner)        )      )    )    ```    This checks if `if` and `loop` integrations handle blocktype constraints correctly to avoid perpetual loops.

(assert_invalid
  (module
    (func $test (result i32)
      (if (result i32) (i32.const 1)
        (then
          (loop $inner
            (br $inner)
          )
        )
      )
    )
  )
  "infinite loop due to blocktype error"
)