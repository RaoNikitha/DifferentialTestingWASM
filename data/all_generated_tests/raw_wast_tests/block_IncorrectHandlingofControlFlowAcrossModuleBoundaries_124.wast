;; 5. Define a `block` that calls an imported function with incorrect nesting of blocks inside it. This test checks if improper nesting is handled properly and does not corrupt the stack across module boundaries.

(assert_invalid
  (module
    (import "env" "external" (func $external (result i32)))
    (func (result i32)
      (block (result i32)
        (block 
          (call $external)
          (i32.const 1)
        )
        (end)
        (br 0)
        (end)
      )
    )
  )
  "type mismatch"
)