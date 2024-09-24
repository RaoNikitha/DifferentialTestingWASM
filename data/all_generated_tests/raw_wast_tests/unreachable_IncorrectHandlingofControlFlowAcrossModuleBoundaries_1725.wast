;; 6. Create a WebAssembly module (`Module A`) exporting a function containing nested blocks with an `unreachable` in the deepest block. Import and call this function from another module (`Module B`) that has multiple instructions to execute post-call. Confirm the correct boundary control flow by ensuring `Module B` traps immediately, ignoring any post-call instructions.

(assert_invalid
  (module (func $type-block-unreachable (result i32)
    (block (result i32)
      (block (result f32) 
        (block (result f64)
          (unreachable)
          (i32.const 0)
        )
        (i32.const 1)
      )
      (i32.const 2)
    )
  ))
  "type mismatch"
)