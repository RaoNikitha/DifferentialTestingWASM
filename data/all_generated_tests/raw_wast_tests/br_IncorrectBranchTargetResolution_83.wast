;; 4. **Extended Block Closure Test**:    - Create a sequence of `block` instructions in a chain-like structure and use the `br` instruction to target a specific block multiple levels up. Confirm that control flow exits correctly to the specified block and not to any intermediary blocks, ensuring accurate relative label indexing.

(assert_invalid
  (module (func $extended_block_closure
    (block
      (block
        (block
          (br 2)
        )
      )
    )
  ))
  "type mismatch"
)