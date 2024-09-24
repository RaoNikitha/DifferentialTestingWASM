;; 10. Develop a function with interleaved `try`, `catch`, and `return` instructions that prematurely exit exception handling blocks, testing WebAssembly’s ability to maintain block context integrity compared to the Wizard Engine’s strategy of resetting stack pointers.

(assert_invalid
  (module
    (func $try-catch-return (result i32)
      (try (result i32)
        (do
          (throw $exception)
          (return (i32.const 42))
        )
        (catch $exception (nop))
      )
    )
  )
  "type mismatch"
)