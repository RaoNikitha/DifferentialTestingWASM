;; 4. Define a loop with an `unreachable` instruction inside a block within the loop. Use a `br` instruction to jump to the outer loop from within the block. Ensure the trap from `unreachable` prevents any incorrect jumps and resolves properly.

(assert_invalid
  (module
    (func $type-loop-block-br-after-unreachable
      (loop
        (block
          unreachable
          br 1
        )
      )
    )
  )
 "type mismatch"
)