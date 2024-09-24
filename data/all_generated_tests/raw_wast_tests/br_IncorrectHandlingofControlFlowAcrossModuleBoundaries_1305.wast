;; 6. **Test Description 6**:    Develop a scenario where an exported function contains an `if-else` construct with a `br` instruction to jump out of the `if-else`. Import and call this function in another module within a nested block. Ensure post-call execution starts at the correct block level.

(assert_invalid
  (module
    (func $exportedFunc
      (export "exportedFunc")
      (if (i32.const 1)
        (then (br 0))
        (else (br 0))
      )
    )
  )
  "type mismatch"
)

(module
  (import "module" "exportedFunc" (func $importedFunc))
  (func
    (block
      (block
        (call $importedFunc)
      )
    )
  )
)