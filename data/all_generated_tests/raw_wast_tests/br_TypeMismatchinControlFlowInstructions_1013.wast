;; Test 4: Set up an if statement that requires an i32 result but misuses a br instruction to direct control flow to a block meant to handle f32 results, creating a type mismatch.

(assert_invalid
  (module 
    (func $type-mismatch-if-block
      (block (result f32)
        (if (result i32)
          (then (br 0))
          (else (f32.const 1.0))
        )
      )
    )
  )
  "type mismatch"
)