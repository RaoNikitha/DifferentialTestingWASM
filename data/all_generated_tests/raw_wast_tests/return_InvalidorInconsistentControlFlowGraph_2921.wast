;; **Test 10: Jumping Out from a Deeply Nested Bracketed Block**  Create a deeply nested bracketed block where the return instruction breaks out, seeing if CFG from WebAssembly and Wizard Engine synchronize correctly. Focus on the outermost block targeting and stack state validity once return jumps out from deep nested structures.  _Checks CFG alignment and stack state consistency jumping out from deeply nested blocks with a return instruction._

(assert_invalid
  (module
    (func $nested-blocks (result i32)
      (block
        (block
          (block
            (return (i32.const 0))
          )
          (i32.const 1)
        )
        (i32.const 2)
      )
    )
  )
  "type mismatch"
)