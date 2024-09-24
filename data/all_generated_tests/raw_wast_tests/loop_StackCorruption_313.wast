;; - Test 4: Construct a loop where the block type includes input types (`valtype1, valtype2`). Design backward branches that mismanage stack content types, causing type conflicts. Observe if stack unwinding correctly regenerates the initial state.

(assert_invalid
  (module (func $stack-unwinding-conflict
    (loop (param i32 f32) 
      (i32.const 42) 
      (f32.const 3.14)
      (br 0)
    ))
  )
  "type mismatch"
)