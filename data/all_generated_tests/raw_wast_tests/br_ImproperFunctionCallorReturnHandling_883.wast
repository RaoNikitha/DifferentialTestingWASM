;; 4. Implement a `loop` that includes a `call` instruction and a `br` targeting the loop itself, checking if the `call` return value is improperly overwritten or lost upon looping, highlighting improper function return handling in WebAssembly.

(assert_invalid
  (module
    (func $loop-call-br
      (loop $start 
        (call $dummy_function)
        (br 0)
      )
    )
    (func $dummy_function (result i32)
      (i32.const 42)
    )
  )
  "type mismatch"
)