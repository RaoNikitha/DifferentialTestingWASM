;; 9. **Test Description:** Implement a `block` with a nested `loop` which has a `br` instruction targeting the block’s end in the condition part of the loop. This targets CFG’s capability to handle conditional branch within nesting, potentially revealing bugs in wizard_engine’s structured control enforcement.

(assert_invalid
  (module
    (func $block-with-loop
      (block $outer_block 
        (loop $inner_loop 
          (br_if 1 (i32.const 1)) 
          (br 0)
        )
      )
    )
  )
  "type mismatch"
)