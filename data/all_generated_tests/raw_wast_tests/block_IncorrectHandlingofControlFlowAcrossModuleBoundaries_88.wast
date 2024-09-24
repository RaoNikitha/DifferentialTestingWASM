;; **Test 9:** Formulate a WASM module with an exported function containing `block` and `loop` instructions. Import this function into another module and call it while managing the loop context and block context. This focuses on proper stack unwinding and maintaining control flow order across module boundaries.

(assert_invalid
  (module
    (func $test
      (block (result i32)
        (loop (result i32)
          (br 2 (i32.const 42))
        )
      )
    )
  )
  "type mismatch"
)