;; <Test 7> Construct a WebAssembly module where a function contains nested `block` constructs. Within the inner block, place a `call` instruction that returns a value consumed by the outer block. Follow this with a `br` instruction branching to the outer block. Check if the return value propagates correctly across the branch.

(assert_invalid
  (module
    (func $nested-blocks
      (block
        (block (result i32)
          (call $someFuncReturningValue)
          (br 1)
        )
        (drop)
      )
    )
    (func $someFuncReturningValue (result i32)
      (i32.const 42)
    )
  )
  "type mismatch"
)