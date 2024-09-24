;; 9. **Loop with Data-dependent Branch and Return**: Implement a loop whose exit condition depends on data read from WebAssembly memory. Confirm if the `return` instruction correctly influences loop exit, avoiding infinite loops due to incorrect data-dependent stack checks.

(assert_invalid
  (module
    (memory 1)
    (func $loop-dependencies (result i32)
      (i32.const 0)
      (loop $loop
        (i32.load (i32.const 0))
        (if (result i32)
          (i32.eqz)
          (then (return (i32.const 1)))
          (else (br $loop))
        )
      )
    )
  )
  "type mismatch"
)