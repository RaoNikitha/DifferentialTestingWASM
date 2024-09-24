;; <Test 4> Create a WebAssembly function containing a `block` structure with multiple `call` instructions calling different functions. At the end of the first `call`, insert a `br` instruction targeting the outermost block. Check if the first function call’s return value is correctly discarded and if execution resumes correctly after the block.

(assert_invalid
  (module
    (func $call_discard_block
      (block
        (call $func_a)
        (br 1)
        (call $func_b)
      )
    )
    (func $func_a (result i32) (i32.const 42))
    (func $func_b (result i32) (i32.const 13))
  )
  "unknown label"
)